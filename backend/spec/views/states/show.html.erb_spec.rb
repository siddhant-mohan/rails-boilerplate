require 'rails_helper'

RSpec.describe "states/show", :type => :view do
  before(:each) do
    @state = assign(:state, State.create!(
      :name => "Name",
      :full_name => "Full Name",
      :country_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/1/)
  end
end
