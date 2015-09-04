require 'rails_helper'

RSpec.describe "states/edit", :type => :view do
  before(:each) do
    @state = assign(:state, State.create!(
      :name => "MyString",
      :full_name => "MyString",
      :country_id => 1
    ))
  end

  it "renders the edit state form" do
    render

    assert_select "form[action=?][method=?]", state_path(@state), "post" do

      assert_select "input#state_name[name=?]", "state[name]"

      assert_select "input#state_full_name[name=?]", "state[full_name]"

      assert_select "input#state_country_id[name=?]", "state[country_id]"
    end
  end
end
