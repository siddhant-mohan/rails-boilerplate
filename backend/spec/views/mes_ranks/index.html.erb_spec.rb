require 'rails_helper'

RSpec.describe "mes_ranks/index", :type => :view do
  before(:each) do
    assign(:mes_ranks, [
      MesRank.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mes_level_id => 1,
        :precedence => 2
      ),
      MesRank.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mes_level_id => 1,
        :precedence => 2
      )
    ])
  end

  it "renders a list of mes_ranks" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
