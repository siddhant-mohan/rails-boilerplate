class UsersController < ApplicationController
	require 'nokogiri'
	respond_to :html, :json

	def index
		authorize! :read, User
		@users=User.search(params)
	end

	def show
		@user = User.find(params[:id])
		authorize! :read, @user
		@roles = @user.roles
	end

	def new
		@user= User.new
		authorize! :create, @user
		respond_with(@user)
	end

	def create
		@user=User.new(user_params)
		authorize! :create, @user
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def edit
		@user=User.find(params[:id])
		authorize! :update, @user
	end

	def update
		@user=User.find(params[:id])
		authorize! :update, @user
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def logged_in
		#This method will return the current logged in user if there is any.
		respond_to do |format|
			if current_user
				format.json { render json: current_user }
			else
				format.json { render json: {:message => "Nobody logged In"}, status: :ok }
			end
		end
	end
	private
	# Using a private method to encapsulate the permissible parameters is
	# just a good pattern since you'll be able to reuse the same permit
	# list between create and update. Also, you can specialize this method
	# with per-user checking of permissible attributes.
	def user_params
		params.require(:user).permit(:uid, :firstname, :lastname, :email, :status, :password, :password_confirmation)
	end
end