class Users::SessionsController < Devise::SessionsController
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
      debugger
      user = User.where(:email => params[:user][:email])[0]
      login_status = :unauthorized
      message = 'Not Authorized'
      if user.nil?
        message = 'Sorry this User does not exist.'
      elsif !user.active?
        message = 'Cannot login because user is not active.'
      elsif user.valid_password?(params[:user][:password]) #Check the password validtity
        sign_in(:user, user) #Sign in the user
        unless current_user.nil?
          login_status = :success
          message = 'Sign in successful'
        end
      else
        message = 'Password Invalid'
      end
      if login_status == :success
        respond_to do |format|
          format.json { render json: {:message => message} }
          format.html { redirect_to root_path }
        end
      else
        respond_to do |format|
          format.json {
            render json: {:message => message}
          }
          format.html {
            flash[:alert] = message
            redirect_to new_user_session_path
          }
        end
      end    
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end
