require 'rails_helper'

RSpec.describe "part_two_entries/show", :type => :view do
  before(:each) do
    @part_two_entry = assign(:part_two_entry, PartTwoEntry.create!(
      :part_two_order_id => 1,
      :type_of_pto => 2,
      :details => "Entry",
      :person_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Entry/)
    expect(rendered).to match(/3/)
  end
end
