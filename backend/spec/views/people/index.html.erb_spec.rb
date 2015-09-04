require 'rails_helper'

RSpec.describe "people/index", :type => :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :service_no => "Service No",
        :name => "Name",
        :gender => 1,
        :birth_place => "Birth Place",
        :person_type => 2,
        :gpf_account_no => "Gpf Account No",
        :type_of_entry_id => 3,
        :engg_group_id => 4,
        :dob_remark => "Dob Remark",
        :dob_change_count => 5,
        :service_book_no => "Service Book No",
        :qualifying_authority => "MyText",
        :non_effective_reason => "Non Effective Reason",
        :non_effective_remarks => "Non Effective Remarks",
        :pran_no => 6,
        :neg_no => 7,
        :handicap_type_id => 8,
        :handicap_datails => "MyText",
        :handicap_restrictions => "MyText",
        :percentage_disability => "MyText",
        :year => "Year",
        :handicap_remarks => "Handicap Remarks",
        :s => 9,
        :h => 10,
        :a => 11,
        :p => 12,
        :e => 13,
        :fitness => 14,
        :medical_remarks => "Medical Remarks"
      ),
      Person.create!(
        :service_no => "Service No",
        :name => "Name",
        :gender => 1,
        :birth_place => "Birth Place",
        :person_type => 2,
        :gpf_account_no => "Gpf Account No",
        :type_of_entry_id => 3,
        :engg_group_id => 4,
        :dob_remark => "Dob Remark",
        :dob_change_count => 5,
        :service_book_no => "Service Book No",
        :qualifying_authority => "MyText",
        :non_effective_reason => "Non Effective Reason",
        :non_effective_remarks => "Non Effective Remarks",
        :pran_no => 6,
        :neg_no => 7,
        :handicap_type_id => 8,
        :handicap_datails => "MyText",
        :handicap_restrictions => "MyText",
        :percentage_disability => "MyText",
        :year => "Year",
        :handicap_remarks => "Handicap Remarks",
        :s => 9,
        :h => 10,
        :a => 11,
        :p => 12,
        :e => 13,
        :fitness => 14,
        :medical_remarks => "Medical Remarks"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Service No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Birth Place".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Gpf Account No".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Dob Remark".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "Service Book No".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Non Effective Reason".to_s, :count => 2
    assert_select "tr>td", :text => "Non Effective Remarks".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => "Handicap Remarks".to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => "Medical Remarks".to_s, :count => 2
  end
end
