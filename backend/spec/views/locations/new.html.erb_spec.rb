require 'rails_helper'

RSpec.describe "locations/new", :type => :view do
  before(:each) do
    assign(:location, Location.new(
      :name => "MyString",
      :full_name => "MyString",
      :state_id => 1,
      :complex_id => 1,
      :location_type => 1
    ))
  end

  it "renders new location form" do
    render

    assert_select "form[action=?][method=?]", locations_path, "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_full_name[name=?]", "location[full_name]"

      assert_select "input#location_state_id[name=?]", "location[state_id]"

      assert_select "input#location_complex_id[name=?]", "location[complex_id]"

      assert_select "input#location_location_type[name=?]", "location[location_type]"
    end
  end
end
