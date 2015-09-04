require 'rails_helper'

RSpec.describe "family_members/show", :type => :view do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      :name => "Name",
      :relation => "Relation",
      :gender => 1,
      :is_special => false,
      :is_nok => false,
      :place_of_association => "Place Of Marriage",
      :nationality => 2,
      :relative_occupation => "Spouse Occ",
      :relative_occupation_details => "Spouse Occ Detail",
      :remarks => "Remarks",
      :person_id => "Person"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Relation/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Place Of Marriage/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Spouse Occ/)
    expect(rendered).to match(/Spouse Occ Detail/)
    expect(rendered).to match(/Remarks/)
    expect(rendered).to match(/Person/)
  end
end
