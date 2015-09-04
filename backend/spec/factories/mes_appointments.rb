FactoryGirl.define do
	factory :mes_appointment do
		name
		full_name "MyString"
		association :mes_level, factory: :mes_level
		association :cadre, factory: :cadre
		association :trade, factory: :trade
		association :mes_appointment_level, factory: :mes_appointment_level
		precedence 1
	end

	factory :invalid_mes_appointment, :parent => :mes_appointment do
		name nil
	end
end
