FactoryGirl.define do
	sequence :name do |n|
		"name#{n}"
	end

	factory :role do
		name
		description Faker::Lorem.sentence
		factory :invalid_role do
			name nil
		end
		factory :user_role do
			association :user
			association :role
		end
		factory :role_permission do
			association :permission
			association :role
		end
	end
end
