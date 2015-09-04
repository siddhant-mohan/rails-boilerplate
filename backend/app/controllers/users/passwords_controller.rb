#####################################################################
# Copyright (C) 2013 Navyug Infosolutions Pvt Ltd.
# Developer : Ranu Pratap Singh
# Email : ranu.singh@navyuginfo.com
# Created Date : 25/7/14
#####################################################################

module Users
	class PasswordsController < Devise::PasswordsController
		def edit
			@token = params[:reset_password_token]
			super
		end

		# PUT /resource/password
		def update
			@user = User.reset_password_by_token(reset_params(params[:user]))
			token = reset_params(params[:user])
			if @user.errors.empty?
				user.unlock_access! if unlockable?(@user)
				message = 'Password set successfully. You may now login with new password'
				flash[:notice] = message
				redirect_to new_user_session_path
			else
				message = 'Could not reset the password'
				if !@user.errors[:reset_password_token].empty?
					message = 'The Password Reset Token is Invalid.Please try to reset the password again'
					flash[:alert] = message
					redirect_to new_user_session_path
				elsif !@user.errors[:password].empty?
					message = 'The Password Invalid. Min 8 characters required.Please try to reset the password again '
					flash[:alert] = message
					redirect_to edit_user_password_path(:reset_password_token=>token["reset_password_token"])
				elsif !@user.errors[:password_confirmation].empty?
					message = 'The Password Doesnt Match.Please try to reset the password again'
					flash[:alert] = message
					redirect_to edit_user_password_path(:reset_password_token=>token["reset_password_token"])
				else
					flash[:alert] = message
					redirect_to new_user_session_path
				end
			end
		end

		private
		def reset_params(params)
			params.slice :reset_password_token, :password, :password_confirmation
		end
	end
end