require 'rails_helper'

RSpec.describe "people/show", :type => :view do
  before(:each) do
    @person = assign(:person, Person.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Service No/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Birth Place/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Gpf Account No/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Dob Remark/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/Service Book No/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Non Effective Reason/)
    expect(rendered).to match(/Non Effective Remarks/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Year/)
    expect(rendered).to match(/Handicap Remarks/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/Medical Remarks/)
  end
end
