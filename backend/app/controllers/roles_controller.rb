class RolesController < ApplicationController
	load_and_authorize_resource
	respond_to :html

	def assign_permission
		if params[:permission_id] == "" || params[:permission_id].nil? || params[:role_id] == "" || params[:role_id].nil?
			head :unprocessable_entity
			return
		end
		@role=Role.find(params[:role_id]) rescue nil
		@permission=Permission.find(params[:permission_id]) rescue nil
		if @permission.nil? || @role.nil?
			head :precondition_failed
			return
		end
		@role.permissions << @permission
		redirect_to role_path @role
	end

	def revoke_permission
		if params[:permission_id] == "" || params[:permission_id].nil? || params[:role_id] == "" || params[:role_id].nil?
			head :unprocessable_entity
			return
		end
		@role=Role.find(params[:role_id]) rescue nil
		@permission=Permission.find(params[:permission_id]) rescue nil
		if @permission.nil? || @role.nil?
			head :precondition_failed
			return
		end
		@role.permissions.destroy @permission
		redirect_to role_path @role
	end

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
