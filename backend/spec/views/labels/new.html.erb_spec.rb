require 'spec_helper'

RSpec.describe "labels/new", :type => :view do
  before(:each) do
    assign(:label, Label.new(
      :key => "MyString",
      :value => "MyString"
    ))
  end

  it "renders new label form" do
    render

    assert_select "form[action=?][method=?]", labels_path, "post" do

      assert_select "input#label_key[name=?]", "label[key]"

      assert_select "input#label_value[name=?]", "label[value]"
    end
  end
end
