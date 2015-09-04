require 'rails_helper'

RSpec.describe "states/index", :type => :view do
  before(:each) do
    assign(:states, [
      State.create!(
        :name => "Name",
        :full_name => "Full Name",
        :country_id => 1
      ),
      State.create!(
        :name => "Name",
        :full_name => "Full Name",
        :country_id => 1
      )
    ])
  end

  it "renders a list of states" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
