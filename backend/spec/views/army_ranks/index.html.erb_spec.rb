require 'rails_helper'

RSpec.describe "army_ranks/index", :type => :view do
  before(:each) do
    assign(:army_ranks, [
      ArmyRank.create!(
        :name => "Name",
        :full_name => "Full Name",
        :military_level_id => 1,
        :precedence => 2
      ),
      ArmyRank.create!(
        :name => "Name",
        :full_name => "Full Name",
        :military_level_id => 1,
        :precedence => 2
      )
    ])
  end

  it "renders a list of army_ranks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
