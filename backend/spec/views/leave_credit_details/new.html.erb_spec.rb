require 'rails_helper'

RSpec.describe "leave_credit_details/new", :type => :view do
  before(:each) do
    assign(:leave_credit_detail, LeaveCreditDetail.new(
      :year => "MyString",
      :leave_type_id => 1,
      :no_of_days => 1,
      :authority => "MyText",
      :person_id => 1
    ))
  end

  it "renders new leave_credit_detail form" do
    render

    assert_select "form[action=?][method=?]", leave_credit_details_path, "post" do

      assert_select "input#leave_credit_detail_year[name=?]", "leave_credit_detail[year]"

      assert_select "input#leave_credit_detail_leave_type_id[name=?]", "leave_credit_detail[leave_type_id]"

      assert_select "input#leave_credit_detail_no_of_days[name=?]", "leave_credit_detail[no_of_days]"

      assert_select "textarea#leave_credit_detail_authority[name=?]", "leave_credit_detail[authority]"

      assert_select "input#leave_credit_detail_person_id[name=?]", "leave_credit_detail[person_id]"
    end
  end
end
