require 'rails_helper'

RSpec.describe "generic_masters/new", :type => :view do
  before(:each) do
    assign(:generic_master, GenericMaster.new(
      :name => "MyString",
      :full_name => "MyString",
      :precedence => 1,
      :table_name => "MyString",
      :status => 1
    ))
  end

  it "renders new generic_master form" do
    render

    assert_select "form[action=?][method=?]", generic_masters_path, "post" do

      assert_select "input#generic_master_name[name=?]", "generic_master[name]"

      assert_select "input#generic_master_full_name[name=?]", "generic_master[full_name]"

      assert_select "input#generic_master_precedence[name=?]", "generic_master[precedence]"

      assert_select "input#generic_master_table_name[name=?]", "generic_master[table_name]"

      assert_select "input#generic_master_status[name=?]", "generic_master[status]"
    end
  end
end
