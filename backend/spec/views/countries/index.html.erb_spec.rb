require 'rails_helper'

RSpec.describe "countries/index", :type => :view do
  before(:each) do
    assign(:countries, [
      Country.create!(
        :name => "Name",
        :full_name => "Full Name"
      ),
      Country.create!(
        :name => "Name",
        :full_name => "Full Name"
      )
    ])
  end

  it "renders a list of countries" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
  end
end
