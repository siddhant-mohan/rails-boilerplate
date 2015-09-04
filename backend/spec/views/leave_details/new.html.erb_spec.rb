require 'rails_helper'

RSpec.describe "leave_details/new", :type => :view do
  before(:each) do
    assign(:leave_detail, LeaveDetail.new(
      :unit_id => 1,
      :Leave_type_id => 1,
      :no_of_days => 1,
      :authority => "MyText",
      :person_id => 1
    ))
  end

  it "renders new leave_detail form" do
    render

    assert_select "form[action=?][method=?]", leave_details_path, "post" do

      assert_select "input#leave_detail_unit_id[name=?]", "leave_detail[unit_id]"

      assert_select "input#leave_detail_Leave_type_id[name=?]", "leave_detail[Leave_type_id]"

      assert_select "input#leave_detail_no_of_days[name=?]", "leave_detail[no_of_days]"

      assert_select "textarea#leave_detail_authority[name=?]", "leave_detail[authority]"

      assert_select "input#leave_detail_person_id[name=?]", "leave_detail[person_id]"
    end
  end
end
