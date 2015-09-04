require 'rails_helper'

describe User do
	#Tests for fields
	it { is_expected.to respond_to :email }
	it { is_expected.to respond_to :encrypted_password }
	it { is_expected.to respond_to :reset_password_token }
	it { is_expected.to respond_to :reset_password_sent_at }
	it { is_expected.to respond_to :remember_created_at }
	it { is_expected.to respond_to :sign_in_count }
	it { is_expected.to respond_to :current_sign_in_at }
	it { is_expected.to respond_to :last_sign_in_at }
	it { is_expected.to respond_to :current_sign_in_ip }
	it { is_expected.to respond_to :last_sign_in_ip }
	it { is_expected.to respond_to :firstname }
	it { is_expected.to respond_to :lastname }
	it { is_expected.to respond_to :created_at }
	it { is_expected.to respond_to :updated_at }
	it { is_expected.to respond_to :confirmation_token }
	it { is_expected.to respond_to :confirmed_at }
	it { is_expected.to respond_to :confirmation_sent_at }
	it { is_expected.to respond_to :unconfirmed_email }
	it { is_expected.to respond_to :roles }
	it { is_expected.to respond_to :status }

	# Tests for validations using shoulda ,matchers
	it { is_expected.to ensure_length_of(:email).is_at_most(255) }
	it { is_expected.to ensure_length_of(:encrypted_password).is_at_most(255) }
	it { is_expected.to ensure_length_of(:reset_password_token).is_at_most(255) }
	it { is_expected.to ensure_length_of(:current_sign_in_ip).is_at_most(255) }
	it { is_expected.to ensure_length_of(:last_sign_in_ip).is_at_most(255) }
	it { is_expected.to ensure_length_of(:firstname).is_at_most(255) }
	it { is_expected.to ensure_length_of(:lastname).is_at_most(255) }
	it { is_expected.to ensure_length_of(:confirmation_token).is_at_most(255) }
	it { is_expected.to ensure_length_of(:unconfirmed_email).is_at_most(255) }

	it { is_expected.to validate_presence_of(:firstname) }

end