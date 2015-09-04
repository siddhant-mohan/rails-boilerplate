require 'rails_helper'

RSpec.describe "part_two_entries/new", :type => :view do
  before(:each) do
    assign(:part_two_entry, PartTwoEntry.new(
      :part_two_order_id => 1,
      :type_of_pto => 1,
      :details => "MyString",
      :person_id => 1
    ))
  end

  it "renders new part_two_entry form" do
    render

    assert_select "form[action=?][method=?]", part_two_entries_path, "post" do

      assert_select "input#part_two_entry_part_two_order_id[name=?]", "part_two_entry[part_two_order_id]"

      assert_select "input#part_two_entry_type_of_pto[name=?]", "part_two_entry[type_of_pto]"

      assert_select "input#part_two_entry_entry[name=?]", "part_two_entry[entry]"

      assert_select "input#part_two_entry_person_id[name=?]", "part_two_entry[person_id]"
    end
  end
end
