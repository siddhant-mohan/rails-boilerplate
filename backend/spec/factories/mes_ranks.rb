FactoryGirl.define do
	factory :mes_rank do
		name
		full_name 'MyString'
		association :mes_level, factory: :mes_level
		precedence 1
	end

	factory :invalid_mes_rank, :parent => :mes_rank do
		name nil
	end
end
