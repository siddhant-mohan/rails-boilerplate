require 'rails_helper'

RSpec.describe "units/show", :type => :view do
	before(:each) do
		@unit = assign(:unit, FactoryGirl.create(:unit))
	end

	it "renders attributes in <p>" do
		pending("Pagination test to be written")
	end
end
