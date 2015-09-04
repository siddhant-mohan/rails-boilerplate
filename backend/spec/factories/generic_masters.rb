FactoryGirl.define do
	factory :generic_master do
		name
		full_name "MyString"
		precedence 1
		table_name "religion"
		status 1
		factory :regiment do
			table_name 'regiment'
		end
		factory :religion do
			table_name 'religion'
		end
		factory :commission_type do
			table_name 'mil_type_of_commission'
		end
		factory :nationality do
			table_name 'nationality'
		end
		factory :marital_status do
			table_name 'marital_status'
		end
		factory :employee_group do
			table_name 'employee_group,'
		end
		factory :engg_group do
			table_name 'engg_group'
		end
		factory :caste do
			table_name 'caste'
		end
		factory :handicap_type do
			table_name 'type_of_handicap'
			end
		factory :military_level do
			table_name 'mil_level'
			end
		factory :complex do
			table_name 'complex'
		end
		factory :mes_level do
			table_name 'mes_level'
		end
		factory :cadre do
			table_name 'mes_officer_cadre'
		end
		factory :mes_appointment_level do
			table_name 'mes_appointment_level'
		end
		factory :trade do
			table_name 'mes_subordinate_trade'
		end

	end
end
