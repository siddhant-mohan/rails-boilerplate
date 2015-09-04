class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_user! # devise check
	# CanCan Rescue block
	rescue_from CanCan::AccessDenied do |exception|
		respond_to do |format|
			format.json {
				render json: {message: exception.message}, :status => :unauthorized
			}
			format.html {
				render template: "layouts/error401", :status => :unauthorized
			}
		end
	end
end
