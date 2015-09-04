require 'spec_helper'

RSpec.describe "labels/index", :type => :view do
  before(:each) do
    assign(:labels, [
      Label.create!(
        :key => "Key",
        :value => "Value"
      ),
      Label.create!(
        :key => "Key",
        :value => "Value"
      )
    ])
  end

  it "renders a list of labels" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
