require 'rails_helper'

RSpec.describe "location_rels/index", :type => :view do
  before(:each) do
    assign(:location_rels, [
      LocationRel.create!(
        :unit_id => 1,
        :location_id => 2
      ),
      LocationRel.create!(
        :unit_id => 1,
        :location_id => 2
      )
    ])
  end

  it "renders a list of location_rels" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
