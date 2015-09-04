require 'rails_helper'

RSpec.describe "units/new", :type => :view do
	before(:each) do
		assign(:unit, FactoryGirl.create(:unit))
	end

	it "renders new unit form" do
		pending("Pagination Test to be written")
	end
end
