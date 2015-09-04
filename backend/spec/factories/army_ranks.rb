FactoryGirl.define do
	factory :army_rank do
		name
		full_name "MyString"
		military_level_id 1
		precedence 1
	end

	factory :invalid_army_rank, :parent => :army_rank do
		name nil
	end
end
