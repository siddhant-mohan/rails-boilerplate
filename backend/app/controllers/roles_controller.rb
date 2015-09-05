class RolesController < ApplicationController
	load_and_authorize_resource
	respond_to :html

	def index
		@roles = Role.all
		respond_with(@roles)
	end

	def show
		@role = Role.find(params[:id])
		respond_with(@role)
	end

	def new
		@role = Role.new
		respond_with(@role)
	end

	def edit
	end

	def create
		@role = Role.new(role_params)
		@role.save
		respond_with(@role)
	end

	def update
		@role.update(role_params)
		respond_with(@role)
	end

	def destroy
		@role.destroy
		respond_with(@role)
	end

	private
	def role_params
		params.require(:role).permit(:name, :description)
	end
end
