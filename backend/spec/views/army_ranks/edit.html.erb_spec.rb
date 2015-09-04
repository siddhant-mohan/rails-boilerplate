require 'rails_helper'

RSpec.describe "army_ranks/edit", :type => :view do
  before(:each) do
    @army_rank = assign(:army_rank, ArmyRank.create!(
      :name => "MyString",
      :full_name => "MyString",
      :military_level_id => 1,
      :precedence => 1
    ))
  end

  it "renders the edit army_rank form" do
    render

    assert_select "form[action=?][method=?]", army_rank_path(@army_rank), "post" do

      assert_select "input#army_rank_name[name=?]", "army_rank[name]"

      assert_select "input#army_rank_full_name[name=?]", "army_rank[full_name]"

      assert_select "input#army_rank_military_level_id[name=?]", "army_rank[military_level_id]"

      assert_select "input#army_rank_precedence[name=?]", "army_rank[precedence]"
    end
  end
end
