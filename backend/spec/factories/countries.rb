require 'faker'

FactoryGirl.define do
	factory :country do
		name { Faker::Name.name }
		full_name 'MyString'
	end
	factory :invalid_country, :parent => :country do
		name nil
	end

end
