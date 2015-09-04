require 'rails_helper'

RSpec.describe "auth_entries/index", :type => :view do
  before(:each) do
    assign(:auth_entries, [
      AuthEntry.create!(
        :appt_type_id => 1,
        :mil => 2,
        :civ => 3,
        :auth_table_id => 4
      ),
      AuthEntry.create!(
        :appt_type_id => 1,
        :mil => 2,
        :civ => 3,
        :auth_table_id => 4
      )
    ])
  end

  it "renders a list of auth_entries" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
