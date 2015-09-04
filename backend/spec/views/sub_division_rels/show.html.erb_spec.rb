require 'rails_helper'

RSpec.describe "sub_division_rels/show", :type => :view do
  before(:each) do
    @sub_division_rel = assign(:sub_division_rel, SubDivisionRel.create!(
      :count => 1,
      :unit_id => 2,
      :sub_division_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
