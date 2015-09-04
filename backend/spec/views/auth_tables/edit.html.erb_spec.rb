require 'rails_helper'

RSpec.describe "auth_tables/edit", :type => :view do
  before(:each) do
    @auth_table = assign(:auth_table, AuthTable.create!(
      :table_type => "MyString",
      :title => false,
      :unit_id => 1
    ))
  end

  it "renders the edit auth_table form" do
    render

    assert_select "form[action=?][method=?]", auth_table_path(@auth_table), "post" do

      assert_select "input#auth_table_table_type[name=?]", "auth_table[table_type]"

      assert_select "input#auth_table_title[name=?]", "auth_table[title]"

      assert_select "input#auth_table_unit_id[name=?]", "auth_table[unit_id]"
    end
  end
end
