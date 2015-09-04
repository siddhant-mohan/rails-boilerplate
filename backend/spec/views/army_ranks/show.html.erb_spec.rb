require 'rails_helper'

RSpec.describe "army_ranks/show", :type => :view do
  before(:each) do
    @army_rank = assign(:army_rank, ArmyRank.create!(
      :name => "Name",
      :full_name => "Full Name",
      :military_level_id => 1,
      :precedence => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
