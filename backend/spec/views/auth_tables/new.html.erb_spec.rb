require 'rails_helper'

RSpec.describe "auth_tables/new", :type => :view do
  before(:each) do
    assign(:auth_table, AuthTable.new(
      :table_type => "MyString",
      :title => false,
      :unit_id => 1
    ))
  end

  it "renders new auth_table form" do
    render

    assert_select "form[action=?][method=?]", auth_tables_path, "post" do

      assert_select "input#auth_table_table_type[name=?]", "auth_table[table_type]"

      assert_select "input#auth_table_title[name=?]", "auth_table[title]"

      assert_select "input#auth_table_unit_id[name=?]", "auth_table[unit_id]"
    end
  end
end
