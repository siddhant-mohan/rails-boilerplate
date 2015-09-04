require 'rails_helper'

RSpec.describe "leave_details/show", :type => :view do
  before(:each) do
    @leave_detail = assign(:leave_detail, LeaveDetail.create!(
      :unit_id => 1,
      :Leave_type_id => 2,
      :no_of_days => 3,
      :authority => "MyText",
      :person_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/4/)
  end
end
