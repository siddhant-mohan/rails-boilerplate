require 'faker'

FactoryGirl.define do
	factory :state do
		name { Faker::Name.name }
		full_name 'MyString'
		association :country, factory: :country
	end

	factory :invalid_state, :parent => :state do
		name nil
	end
end
