require 'rails_helper'

RSpec.describe "locations/edit", :type => :view do
  before(:each) do
    @location = assign(:location, Location.create!(
      :name => "MyString",
      :full_name => "MyString",
      :state_id => 1,
      :complex_id => 1,
      :location_type => 1
    ))
  end

  it "renders the edit location form" do
    render

    assert_select "form[action=?][method=?]", location_path(@location), "post" do

      assert_select "input#location_name[name=?]", "location[name]"

      assert_select "input#location_full_name[name=?]", "location[full_name]"

      assert_select "input#location_state_id[name=?]", "location[state_id]"

      assert_select "input#location_complex_id[name=?]", "location[complex_id]"

      assert_select "input#location_location_type[name=?]", "location[location_type]"
    end
  end
end
