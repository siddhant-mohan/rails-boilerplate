require 'rails_helper'

RSpec.describe "states/new", :type => :view do
  before(:each) do
    assign(:state, State.new(
      :name => "MyString",
      :full_name => "MyString",
      :country_id => 1
    ))
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do

      assert_select "input#state_name[name=?]", "state[name]"

      assert_select "input#state_full_name[name=?]", "state[full_name]"

      assert_select "input#state_country_id[name=?]", "state[country_id]"
    end
  end
end
