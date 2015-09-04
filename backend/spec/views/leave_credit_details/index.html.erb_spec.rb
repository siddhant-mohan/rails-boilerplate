require 'rails_helper'

RSpec.describe "leave_credit_details/index", :type => :view do
  before(:each) do
    assign(:leave_credit_details, [
      LeaveCreditDetail.create!(
        :year => "Year",
        :leave_type_id => 1,
        :no_of_days => 2,
        :authority => "MyText",
        :person_id => 3
      ),
      LeaveCreditDetail.create!(
        :year => "Year",
        :leave_type_id => 1,
        :no_of_days => 2,
        :authority => "MyText",
        :person_id => 3
      )
    ])
  end

  it "renders a list of leave_credit_details" do
    render
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
