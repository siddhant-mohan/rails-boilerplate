require 'rails_helper'

RSpec.describe "generic_masters/show", :type => :view do
  before(:each) do
    @generic_master = assign(:generic_master, GenericMaster.create!(
      :name => "Name",
      :full_name => "Full Name",
      :precedence => 1,
      :table_name => "Table Name",
      :status => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Table Name/)
    expect(rendered).to match(/2/)
  end
end
