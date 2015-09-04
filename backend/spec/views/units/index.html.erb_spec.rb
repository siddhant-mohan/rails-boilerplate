require 'rails_helper'

RSpec.describe "units/index", :type => :view do
	before(:each) do
		FactoryGirl.create(:unit)
		FactoryGirl.create(:unit)
		assign(:units, Unit.all)
	end

	it "renders a list of units" do
		pending("Pagination test to be written")
	end
end
