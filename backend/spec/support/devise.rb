module ControllerMacros
	# helper to login automatically before each test and logout after each test
	# this helper should be called in test file to achieve the same
	# @param
	def handle_session
		before(:each) do
			@request.env["devise.mapping"] = Devise.mappings[:user]
			@logged_in_user = FactoryGirl.create(:user)
			sign_in @logged_in_user
			expect(subject.current_user).not_to eq(nil)
		end
		after(:each) do
			sign_out @logged_in_user
		end
	end
end