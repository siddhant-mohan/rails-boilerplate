require 'spec_helper'

RSpec.describe "labels/edit", :type => :view do
  before(:each) do
    @label = assign(:label, Label.create!(
      :key => "MyString",
      :value => "MyString"
    ))
  end

  it "renders the edit label form" do
    render

    assert_select "form[action=?][method=?]", label_path(@label), "post" do

      assert_select "input#label_key[name=?]", "label[key]"

      assert_select "input#label_value[name=?]", "label[value]"
    end
  end
end
