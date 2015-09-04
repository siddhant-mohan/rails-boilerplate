FactoryGirl.define do
	factory :leave_detail do
		unit_id 1
		leave_type_id 1
		date_from "2015-01-30"
		date_to "2015-01-30"
		no_of_days 1
		authority "MyText"
		person_id 1
	end
end
