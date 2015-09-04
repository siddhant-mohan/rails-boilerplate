require 'rails_helper'

RSpec.describe "auth_tables/show", :type => :view do
  before(:each) do
    @auth_table = assign(:auth_table, AuthTable.create!(
      :table_type => "Table Type",
      :title => false,
      :unit_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Table Type/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/1/)
  end
end
