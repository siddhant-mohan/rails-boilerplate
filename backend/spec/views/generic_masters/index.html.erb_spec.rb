require 'rails_helper'

RSpec.describe "generic_masters/index", :type => :view do
  before(:each) do
    assign(:generic_masters, [
      GenericMaster.create!(
        :name => "Name",
        :full_name => "Full Name",
        :precedence => 1,
        :table_name => "Table Name",
        :status => 2
      ),
      GenericMaster.create!(
        :name => "Name",
        :full_name => "Full Name",
        :precedence => 1,
        :table_name => "Table Name",
        :status => 2
      )
    ])
  end

  it "renders a list of generic_masters" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Table Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
