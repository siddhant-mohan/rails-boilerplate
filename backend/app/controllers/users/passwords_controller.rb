class Users::PasswordsController < Devise::PasswordsController
  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  def create
    super
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    @token = params[:reset_password_token]
    super
  end

  # PUT /resource/password
  def update
    @user = User.reset_password_by_token(reset_params(params[:user]))
    super
  end

  private
  def reset_params(params)
    params.slice :reset_password_token, :password, :password_confirmation
  end
  
  protected

  def after_resetting_password_path_for(resource)
    super(resource)
  end

  # The path used after sending reset password instructions
  def after_sending_reset_password_instructions_path_for(resource_name)
    super(resource_name)
  end
end
