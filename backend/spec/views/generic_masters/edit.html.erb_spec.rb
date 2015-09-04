require 'rails_helper'

RSpec.describe "generic_masters/edit", :type => :view do
  before(:each) do
    @generic_master = assign(:generic_master, GenericMaster.create!(
      :name => "MyString",
      :full_name => "MyString",
      :precedence => 1,
      :table_name => "MyString",
      :status => 1
    ))
  end

  it "renders the edit generic_master form" do
    render

    assert_select "form[action=?][method=?]", generic_master_path(@generic_master), "post" do

      assert_select "input#generic_master_name[name=?]", "generic_master[name]"

      assert_select "input#generic_master_full_name[name=?]", "generic_master[full_name]"

      assert_select "input#generic_master_precedence[name=?]", "generic_master[precedence]"

      assert_select "input#generic_master_table_name[name=?]", "generic_master[table_name]"

      assert_select "input#generic_master_status[name=?]", "generic_master[status]"
    end
  end
end
