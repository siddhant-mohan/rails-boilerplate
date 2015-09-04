require 'rails_helper'

RSpec.describe "sub_division_rels/edit", :type => :view do
  before(:each) do
    @sub_division_rel = assign(:sub_division_rel, SubDivisionRel.create!(
      :count => 1,
      :unit_id => 1,
      :sub_division_id => 1
    ))
  end

  it "renders the edit sub_division_rel form" do
    render

    assert_select "form[action=?][method=?]", sub_division_rel_path(@sub_division_rel), "post" do

      assert_select "input#sub_division_rel_count[name=?]", "sub_division_rel[count]"

      assert_select "input#sub_division_rel_unit_id[name=?]", "sub_division_rel[unit_id]"

      assert_select "input#sub_division_rel_sub_division_id[name=?]", "sub_division_rel[sub_division_id]"
    end
  end
end
