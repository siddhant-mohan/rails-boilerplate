require 'rails_helper'

RSpec.describe "auth_entries/edit", :type => :view do
  before(:each) do
    @auth_entry = assign(:auth_entry, AuthEntry.create!(
      :appt_type_id => 1,
      :mil => 1,
      :civ => 1,
      :auth_table_id => 1
    ))
  end

  it "renders the edit auth_entry form" do
    render

    assert_select "form[action=?][method=?]", auth_entry_path(@auth_entry), "post" do

      assert_select "input#auth_entry_appt_type_id[name=?]", "auth_entry[appt_type_id]"

      assert_select "input#auth_entry_mil[name=?]", "auth_entry[mil]"

      assert_select "input#auth_entry_civ[name=?]", "auth_entry[civ]"

      assert_select "input#auth_entry_auth_table_id[name=?]", "auth_entry[auth_table_id]"
    end
  end
end
