class Users::RegistrationsController < Devise::RegistrationsController
before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]
around_filter :set_code, only: [:create]

  # GET /resource/sign_up
  def new
    @codes_available = SecretCode.where(:user_id => nil)[0].code
    super
  end

  # POST /resource
  def create
    super
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << :firstname
    devise_parameter_sanitizer.for(:sign_up) << :lastname
    devise_parameter_sanitizer.for(:sign_up) << :email
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << :attribute
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def set_code
    if params[:user][:code] and params[:user][:code] == params[:user][:codes_available]
      yield
      if @user
        @concerned_code = SecretCode.where(:code => params[:user][:code])[0]
        @concerned_code.user_id = @user.id
        @concerned_code.save
      end
    else
      respond_to do |format|
        format.html {redirect_to sign_up_users_path}
      end
    end
  end
end
