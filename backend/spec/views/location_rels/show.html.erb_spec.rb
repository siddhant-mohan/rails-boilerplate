require 'rails_helper'

RSpec.describe "location_rels/show", :type => :view do
  before(:each) do
    @location_rel = assign(:location_rel, LocationRel.create!(
      :unit_id => 1,
      :location_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
