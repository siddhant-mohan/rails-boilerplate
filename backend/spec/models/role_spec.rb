require 'rails_helper'

RSpec.describe Role, :type => :model do
	let(:permission2) {
		FactoryGirl.create :permission
	}

	let(:role1) {
		FactoryGirl.create :role
	}

	it { is_expected.to respond_to :name }
	it { is_expected.to respond_to :description }
	it { is_expected.to respond_to :permissions }
	it { is_expected.to respond_to :permissions= }
	it { is_expected.to respond_to :users }
	it { is_expected.to respond_to :users= }
	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_uniqueness_of(:name) }

	it 'should create a new permission' do
		c1 = role1.permissions.count
		role1.permissions << permission2
		role1.reload
		c2 = role1.permissions.count
		expect(c2).to eq(c1+1)
	end

end
