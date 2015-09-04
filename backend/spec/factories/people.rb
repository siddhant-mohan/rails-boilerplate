FactoryGirl.define do
	sequence :service_no do |n|
		"Service_no#{n}"
	end
	factory :person do
		service_no
		name "MyString"
		birth_place "MyString"
		person_type 'mil'
		fitness "fit"
		appointee_type "regular"
		gender "male"
		gpf_account_no "MyString"
		dob "2015-01-28"
		dob_remark "MyString"
		dob_change_count 1
		service_book_no "MyString"
		service_book_centralized_date "2015-01-28"
		qualifying_due_date "2015-01-28"
		qualifying_actual_date "2015-01-28"
		qualifying_authority "MyText"
		non_effective_date "2015-01-28"
		non_effective_reason "MyString"
		non_effective_remarks "MyString"
		blc_issued_date "2015-01-28"
		pran_no 1
		neg_no 1
		handicap_type_id 1
		handicap_details "MyText"
		handicap_restrictions "MyText"
		percentage_disability "MyText"
		handicap_year "MyString"
		handicap_remarks "MyString"
		s 1
		h 1
		a 1
		p 1
		e 1
		association :mil_commission_type
		association :nationality
		association :marital_status
		association :regiment
		association :employee_group
		association :engg_group
		association :caste
		association :religion
		association :handicap_type

		medical_remarks "MyString"

		factory :invalid_person,:parent=> :person do
			service_no nil
			name nil
			person_type nil
		end

	end

end
