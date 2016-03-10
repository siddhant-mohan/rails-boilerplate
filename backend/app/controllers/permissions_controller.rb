class PermissionsController < ApplicationController
	respond_to :html

	def index
		authorize! :read, Permission
		@permissions = Permission.all
		respond_with(@permissions)
	end

end

