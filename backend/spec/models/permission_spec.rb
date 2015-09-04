require 'rails_helper'

RSpec.describe Permission, :type => :model do
	it { is_expected.to respond_to :title }
	it { is_expected.to respond_to :action }
	it { is_expected.to respond_to :subject }
	it { is_expected.to respond_to :roles }
	it { is_expected.to validate_presence_of(:action) }
	it { is_expected.to validate_presence_of(:subject) }
end
