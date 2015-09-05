class HomeController < ApplicationController
	def index
		if current_user.nil?
			redirect_to login_path
		else
			redirect_to secret_codes_path
		end
	end

	def login
		redirect_to new_user_session_path
	end
end
