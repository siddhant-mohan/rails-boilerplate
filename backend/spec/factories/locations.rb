FactoryGirl.define do
	factory :location do
		name
		full_name 'MyString'
		state_id 1
		association :complex, factory: :complex
		location_type 'peace'
	end

	factory :invalid_location, :parent => :location do
		name nil
	end
end
