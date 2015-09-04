require 'rails_helper'

RSpec.describe "family_members/index", :type => :view do
  before(:each) do
    assign(:family_members, [
      FamilyMember.create!(
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
      ),
      FamilyMember.create!(
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
      )
    ])
  end

  it "renders a list of family_members" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Relation".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Place Of Marriage".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Spouse Occ".to_s, :count => 2
    assert_select "tr>td", :text => "Spouse Occ Detail".to_s, :count => 2
    assert_select "tr>td", :text => "Remarks".to_s, :count => 2
    assert_select "tr>td", :text => "Person".to_s, :count => 2
  end
end
