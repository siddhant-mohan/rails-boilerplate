require 'rails_helper'

RSpec.describe "people/new", :type => :view do
  before(:each) do
    assign(:person, Person.new(
      :service_no => "MyString",
      :name => "MyString",
      :gender => 1,
      :birth_place => "MyString",
      :person_type => 1,
      :gpf_account_no => "MyString",
      :type_of_entry_id => 1,
      :engg_group_id => 1,
      :dob_remark => "MyString",
      :dob_change_count => 1,
      :service_book_no => "MyString",
      :qualifying_authority => "MyText",
      :non_effective_reason => "MyString",
      :non_effective_remarks => "MyString",
      :pran_no => 1,
      :neg_no => 1,
      :handicap_type_id => 1,
      :handicap_datails => "MyText",
      :handicap_restrictions => "MyText",
      :percentage_disability => "MyText",
      :year => "MyString",
      :handicap_remarks => "MyString",
      :s => 1,
      :h => 1,
      :a => 1,
      :p => 1,
      :e => 1,
      :fitness => 1,
      :medical_remarks => "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input#person_service_no[name=?]", "person[service_no]"

      assert_select "input#person_name[name=?]", "person[name]"

      assert_select "input#person_gender[name=?]", "person[gender]"

      assert_select "input#person_birth_place[name=?]", "person[birth_place]"

      assert_select "input#person_person_type[name=?]", "person[person_type]"

      assert_select "input#person_gpf_account_no[name=?]", "person[gpf_account_no]"

      assert_select "input#person_type_of_entry_id[name=?]", "person[type_of_entry_id]"

      assert_select "input#person_engg_group_id[name=?]", "person[engg_group_id]"

      assert_select "input#person_dob_remark[name=?]", "person[dob_remark]"

      assert_select "input#person_dob_change_count[name=?]", "person[dob_change_count]"

      assert_select "input#person_service_book_no[name=?]", "person[service_book_no]"

      assert_select "textarea#person_qualifying_authority[name=?]", "person[qualifying_authority]"

      assert_select "input#person_non_effective_reason[name=?]", "person[non_effective_reason]"

      assert_select "input#person_non_effective_remarks[name=?]", "person[non_effective_remarks]"

      assert_select "input#person_pran_no[name=?]", "person[pran_no]"

      assert_select "input#person_neg_no[name=?]", "person[neg_no]"

      assert_select "input#person_handicap_type_id[name=?]", "person[handicap_type_id]"

      assert_select "textarea#person_handicap_datails[name=?]", "person[handicap_datails]"

      assert_select "textarea#person_handicap_restrictions[name=?]", "person[handicap_restrictions]"

      assert_select "textarea#person_percentage_disability[name=?]", "person[percentage_disability]"

      assert_select "input#person_year[name=?]", "person[year]"

      assert_select "input#person_handicap_remarks[name=?]", "person[handicap_remarks]"

      assert_select "input#person_s[name=?]", "person[s]"

      assert_select "input#person_h[name=?]", "person[h]"

      assert_select "input#person_a[name=?]", "person[a]"

      assert_select "input#person_p[name=?]", "person[p]"

      assert_select "input#person_e[name=?]", "person[e]"

      assert_select "input#person_fitness[name=?]", "person[fitness]"

      assert_select "input#person_medical_remarks[name=?]", "person[medical_remarks]"
    end
  end
end
