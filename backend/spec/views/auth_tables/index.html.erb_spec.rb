require 'rails_helper'

RSpec.describe "auth_tables/index", :type => :view do
  before(:each) do
    assign(:auth_tables, [
      AuthTable.create!(
        :table_type => "Table Type",
        :title => false,
        :unit_id => 1
      ),
      AuthTable.create!(
        :table_type => "Table Type",
        :title => false,
        :unit_id => 1
      )
    ])
  end

  it "renders a list of auth_tables" do
    render
    assert_select "tr>td", :text => "Table Type".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
