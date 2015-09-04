require 'rails_helper'

RSpec.describe "location_rels/new", :type => :view do
  before(:each) do
    assign(:location_rel, LocationRel.new(
      :unit_id => 1,
      :location_id => 1
    ))
  end

  it "renders new location_rel form" do
    render

    assert_select "form[action=?][method=?]", location_rels_path, "post" do

      assert_select "input#location_rel_unit_id[name=?]", "location_rel[unit_id]"

      assert_select "input#location_rel_location_id[name=?]", "location_rel[location_id]"
    end
  end
end
