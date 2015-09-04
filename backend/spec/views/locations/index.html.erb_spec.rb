require 'rails_helper'

RSpec.describe "locations/index", :type => :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :name => "Name",
        :full_name => "Full Name",
        :state_id => 1,
        :complex_id => 2,
        :location_type => 3
      ),
      Location.create!(
        :name => "Name",
        :full_name => "Full Name",
        :state_id => 1,
        :complex_id => 2,
        :location_type => 3
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
