require 'rails_helper'

RSpec.describe "leave_credit_details/show", :type => :view do
  before(:each) do
    @leave_credit_detail = assign(:leave_credit_detail, LeaveCreditDetail.create!(
      :year => "Year",
      :leave_type_id => 1,
      :no_of_days => 2,
      :authority => "MyText",
      :person_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
  end
end
