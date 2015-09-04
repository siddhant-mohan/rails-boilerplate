require 'rails_helper'

RSpec.describe "units/edit", :type => :view do
  before(:each) do
    @unit = assign(:unit, FactoryGirl.create(:unit))
  end

  it "renders the edit unit form" do
    render

    assert_select "form[action=?][method=?]", unit_path(@unit), "post" do

      assert_select "input#unit_name[name=?]", "unit[name]"

      assert_select "input#unit_unit_type[name=?]", "unit[unit_type]"

      assert_select "input#unit_sus_no[name=?]", "unit[sus_no]"

      assert_select "input#unit_supported_org[name=?]", "unit[supported_org]"

      assert_select "input#unit_parent_unit[name=?]", "unit[parent_unit]"

      assert_select "input#unit_status[name=?]", "unit[status]"
    end
  end
end
