require 'rails_helper'

RSpec.describe "countries/show", :type => :view do
  before(:each) do
    @country = assign(:country, Country.create!(
      :name => "Name",
      :full_name => "Full Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
  end
end
