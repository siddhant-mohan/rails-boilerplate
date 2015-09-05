Backend::Application.routes.draw do
  	resources :secret_codes
	resources :roles do
		collection do
			post 'assign_permission'
			delete 'revoke_permission'
		end
	end
	resources :permissions, :only => ['index']
	# user and authentication related routes start
	resources :users do
		collection do
			get 'logged_in'
			post 'sign_in' => 'users#user_signin'
			post 'change_password'
			post 'forgot_password'
			get 'resend_confirmation'
			post 'sign_up' => 'users#user_signup'
			get 'sample_user_csv'
			post 'upload_user_csv'
			post 'assign_role'
			delete 'revoke_role'
		end

	end
	devise_for :users, path: 'auth', controllers: {
											 confirmations: 'users/confirmations',
											 passwords: 'users/passwords',
											 registrations: 'users/registrations',
											 sessions: 'users/sessions',
									 }
	#For setting routes devise_scope must be used
	devise_scope :user do
		get 'sign_out' => 'users/sessions#destroy'
		get 'sign_in' => 'users/sessions#new'
		get 'sign_up' => 'users/registrations#new'

	end

	get '/login' => 'home#login'
	# You can have the root of your site routed with "root"
	root 'home#index'
end
