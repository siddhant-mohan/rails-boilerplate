FactoryGirl.define do
	sequence :action do |n|
		"action#{n}"
	end

	sequence :subject do |n|
		"subject#{n}"
	end

	factory :permission do
		title "MyString"
		action
		subject
	end

end
