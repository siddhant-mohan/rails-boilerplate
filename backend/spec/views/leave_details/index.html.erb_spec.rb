require 'rails_helper'

RSpec.describe "leave_details/index", :type => :view do
  before(:each) do
    assign(:leave_details, [
      LeaveDetail.create!(
        :unit_id => 1,
        :Leave_type_id => 2,
        :no_of_days => 3,
        :authority => "MyText",
        :person_id => 4
      ),
      LeaveDetail.create!(
        :unit_id => 1,
        :Leave_type_id => 2,
        :no_of_days => 3,
        :authority => "MyText",
        :person_id => 4
      )
    ])
  end

  it "renders a list of leave_details" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
