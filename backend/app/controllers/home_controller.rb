class HomeController < ApplicationController
	def index
		if current_user.nil?
			redirect_to login_path
		end
	end

	def login
		redirect_to new_user_session_path
	end
end
