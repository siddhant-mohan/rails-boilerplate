require 'spec_helper'

RSpec.describe "labels/show", :type => :view do
  before(:each) do
    @label = assign(:label, Label.create!(
      :key => "Key",
      :value => "Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Key/)
    expect(rendered).to match(/Value/)
  end
end
