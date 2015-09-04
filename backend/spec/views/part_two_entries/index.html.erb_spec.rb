require 'rails_helper'

RSpec.describe "part_two_entries/index", :type => :view do
  before(:each) do
    assign(:part_two_entries, [
      PartTwoEntry.create!(
        :part_two_order_id => 1,
        :type_of_pto => 2,
        :details => "Entry",
        :person_id => 3
      ),
      PartTwoEntry.create!(
        :part_two_order_id => 1,
        :type_of_pto => 2,
        :details => "Entry",
        :person_id => 3
      )
    ])
  end

  it "renders a list of part_two_entries" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Entry".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
