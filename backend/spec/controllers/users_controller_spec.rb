require 'rails_helper'

describe UsersController, :type => :controller do
	let(:user_pass) {
		'new life'
	}
	let(:role2) { FactoryGirl.create :role }
	let(:role1) { FactoryGirl.create :role }
	let(:new_user) {
		user_attrs = FactoryGirl.attributes_for :user, :email => 'navyugtesting@gmail.com'
		user_attrs.delete :password
		user = User.where(user_attrs).first_or_create :password => user_pass
		user.reload
		user.status = "active"
		user.save!
		user
	}
	let(:user) { FactoryGirl.create :user }

	let(:user_role) do
		{:user_id => user.id, :role_id => role2.id}
	end
	let(:invalid_user_role) do
		{:user_id => user.id+4, :role_id => role2.id+3}
	end
	handle_session

	describe 'Adding role to user' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:assign_role, User)
			end
			it 'Should assign a role with valid attributes' do
				rc1 = user.roles.count
				post :assign_role, user_role
				user.reload
				rc2 = user.roles.count
				expect(rc2).to eq(rc1+1)
			end

			it 'should not assign a duplicate role ' do
				user.roles << role2
				rc1 = user.roles.count
				post :assign_role, user_role
				user.reload
				rc2 = user.roles.count
				expect(rc2).to eq(rc1)
			end

			it 'Should return status code 422 with invalid attributes' do
				post :assign_role, invalid_user_role
				expect(response).to have_http_status(:precondition_failed)
			end
		end
		context 'when not authorized' do
			it 'renders unauthorized' do
				revoke_permission(:assign_role, User)
				rc1 = user.roles.count
				post :assign_role, user_role
				user.reload
				rc2 = user.roles.count
				expect(rc2).to eq(rc1)
				expect(response).to have_http_status(401)
			end
		end
	end

	describe 'Removing role to user' do
		context 'when authorized' do
			before(:each) do
				assign_permission(:revoke_role, User)
			end
			it 'Should remove a role with valid attributes' do
				user.roles << role2
				rc1 = user.roles.count
				post :revoke_role, user_role
				user.reload
				rc2 = user.roles.count
				expect(rc2).to eq(rc1-1)
			end

			it 'Should return status code 422 with invalid attributes' do
				post :revoke_role, invalid_user_role
				expect(response).to have_http_status(:precondition_failed)
			end

		end

		context 'when not authorized' do
			it 'render unauthorized' do
				revoke_permission(:revoke_role,User)
				user.roles << role2
				rc1 = user.roles.count
				post :revoke_role, user_role
				user.reload
				rc2 = user.roles.count
				expect(rc2).to eq(rc1)
				expect(response).to have_http_status(401)
			end
		end

	end


	describe 'handling requests for user_signup' do
		it 'should not respond to get request' do
			get :user_signup
			expect(response.code).to eq '406'
		end

		it 'should not respond to simple post request' do
			post :user_signup
			expect(response.code).to eq '406'
		end
	end

	describe 'testing user login' do
		context 'when not logged in' do
			it 'should not respond to get request' do
				get :user_signin
				expect(response.code).to eq '406'
			end

			it 'should not respond to simple post request' do
				post :user_signin
				expect(response.code).to eq '406'
			end

			it 'should login a user with valid credentials' do
				pending("Pending test case for use sign in method")
				# user = new_user
				# xhr :post, :user_signin, user: {email: user.email, password: user_pass}
				# expect(response.code).to eq '200'
				# expect(response.body).to include('message', 'Sign in', 'successful')
			end

			it 'should respond with password invalid for user with invalid password' do
				pending("Pending test case for use sign in method")
				# sign_out(subject.current_user) if subject.current_user
				# user = new_user
				# xhr :post, :user_signin, user: {email: user.email, password: 'someRandomPassword123'}
				# expect(response.code).to eq '200'
				# expect(response.body).to include('message', 'Password', 'invalid')
			end
		end
	end

	describe 'when the user is logged in' do
		it 'should return user if current user exist' do
			xhr :get, :logged_in, :format => :json
			expect(response.code).to eq '200'
			expect(response.body).to include('id')
			expect(response.body).to include('firstname')
			expect(response.body).to include('lastname')
			expect(response.body).to include('email')
		end

		it 'should return nothing if current user does not exist' do
			pending("Pending test case for user logged in method")
			# sign_out(subject.current_user)
			# xhr :get, :logged_in, :format => :json
			# expect(response.code).to eq '200'
			# expect(response.body).to include('message', 'Nobody logged In')
		end

		it 'should log out current user if new user tries to login and sign in new user' do
			pending("Pending test case for use logged in method")
			# signedid = subject.current_user.id
			# user = new_user
			# xhr :post, :user_signin, user: {email: user.email, password: user_pass}
			# expect(response.code).to eq '200'
			# expect(response.body).to include('message', 'Sign in', 'successful')
		end
	end

	describe 'creating User on XHR requests' do
		it 'should create User with valid params in the XHR request' do
			expect {
				xhr :post, :user_signup, user: {firstname: 'Test', lastname: 'User', email: 'te@gmail.com', uid: "mes234", password: '12345678'}
			}.to change(User, :count).by(1)
			expect(response.code).to eq '200'

		end

		it 'should not create User with invalid email in the XHR request' do
			expect {
				xhr :post, :user_signup, user: {firstname: 'Test', lastname: 'User', email: 'tegmailcom', password: '12345678'}
			}.to change(User, :count).by(0)
			expect(response.code).to eq '200'
			expect(response.body).to include('email', 'invalid')
		end

		it 'should not create User with invalid password in the XHR request' do
			expect {
				xhr :post, :user_signup, user: {firstname: 'Test', lastname: 'User', email: 'te@gmail.com', password: '123'}
			}.to change(User, :count).by(0)
			expect(response.code).to eq '200'
			expect(response.body).to include('password', 'too short')
		end

	end

	# user is not confirmable as of now
	# describe 'User resend confirmations instructions' do
	# 	handle_session
	#
	# 	it 'should respond with Already Confirmed if user is confirmed' do
	# 		user = subject.current_user
	# 		user.confirm!
	# 		xhr :get,:resend_confirmation
	# 		expect(response.code).to eq '200'
	# 		expect(response.body).to include('message', 'Already Confirmed')
	# 	end
	#
	# 	it 'should respond with Sent if user is not confirmed and confirmation instructions resent' do
	# 		user = FactoryGirl.create(:user)
	# 		user.reload
	#
	# 		previous_confirm_time = user.confirmation_sent_at
	# 		sleep 2
	# 		sign_in(:user,user)
	# 		xhr :get,:resend_confirmation
	# 		expect(response.code).to eq '200'
	# 		expect(response.body).to include('message', 'Sent')
	# 		subject.current_user.confirmation_sent_at != previous_confirm_time
	# 	end
	#
	# end

end