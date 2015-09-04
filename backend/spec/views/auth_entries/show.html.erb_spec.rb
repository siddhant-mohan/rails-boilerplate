require 'rails_helper'

RSpec.describe "auth_entries/show", :type => :view do
  before(:each) do
    @auth_entry = assign(:auth_entry, AuthEntry.create!(
      :appt_type_id => 1,
      :mil => 2,
      :civ => 3,
      :auth_table_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
