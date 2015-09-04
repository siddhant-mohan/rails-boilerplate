require 'rails_helper'

RSpec.describe "sub_division_rels/index", :type => :view do
  before(:each) do
    assign(:sub_division_rels, [
      SubDivisionRel.create!(
        :count => 1,
        :unit_id => 2,
        :sub_division_id => 3
      ),
      SubDivisionRel.create!(
        :count => 1,
        :unit_id => 2,
        :sub_division_id => 3
      )
    ])
  end

  it "renders a list of sub_division_rels" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
