#####################################################################
# Copyright (C) 2015 Navyug Infosolutions Pvt Ltd.
# Developer : Ranu Pratap Singh
# Email : ranu.singh@navyuginfo.com
# Created Date : 15/01/15
#####################################################################

module Users
	class SessionsController < Devise::SessionsController
		# @method create
		# this is the method responsible for sign_in of any user
		def create
			user = User.find_by_uid(params[:user][:uid])
			login_status = :unauthorized
			message = 'Not Authorized'
			if user.nil?
				message = 'Sorry this User does not exist.'
			elsif !user.active?
				message = 'Cannot login because user is not active.'
			elsif user.valid_password?(params[:user][:password]) #Check the password validtity
				sign_in(:user, user) #Sign in the user
				unless current_user.nil?
					login_status = :success
					message = 'Sign in successful'
				end
			else
				message = 'Password Invalid'
			end
			if login_status == :success
				respond_to do |format|
					format.json { render json: {:message => message} }
					format.html { redirect_to root_path }
				end
			else
				respond_to do |format|
					format.json {
						render json: {:message => message}
					}
					format.html {
						flash[:alert] = message
						redirect_to new_user_session_path
					}
				end
			end
		end

	end
end