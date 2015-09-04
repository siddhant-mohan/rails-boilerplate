require 'rails_helper'

RSpec.describe "family_members/edit", :type => :view do
  before(:each) do
    @family_member = assign(:family_member, FamilyMember.create!(
      :name => "MyString",
      :relation => "MyString",
      :gender => 1,
      :is_special => false,
      :is_nok => false,
      :place_of_association => "MyString",
      :nationality => 1,
      :relative_occupation => "MyString",
      :relative_occupation_details => "MyString",
      :remarks => "MyString",
      :person_id => "MyString"
    ))
  end

  it "renders the edit family_member form" do
    render

    assert_select "form[action=?][method=?]", family_member_path(@family_member), "post" do

      assert_select "input#family_member_name[name=?]", "family_member[name]"

      assert_select "input#family_member_relation[name=?]", "family_member[relation]"

      assert_select "input#family_member_gender[name=?]", "family_member[gender]"

      assert_select "input#family_member_special_child[name=?]", "family_member[is_special]"

      assert_select "input#family_member_nok[name=?]", "family_member[is_nok]"

      assert_select "input#family_member_place_of_marriage[name=?]", "family_member[place_of_association]"

      assert_select "input#family_member_nationality[name=?]", "family_member[nationality]"

      assert_select "input#family_member_spouse_occ[name=?]", "family_member[relative_occupation]"

      assert_select "input#family_member_spouse_occ_detail[name=?]", "family_member[relative_occupation_details]"

      assert_select "input#family_member_remarks[name=?]", "family_member[remarks]"

      assert_select "input#family_member_person_id[name=?]", "family_member[person_id]"
    end
  end
end
