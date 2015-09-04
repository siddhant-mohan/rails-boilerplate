require 'rails_helper'

RSpec.describe "mes_ranks/new", :type => :view do
  before(:each) do
    assign(:mes_rank, MesRank.new(
      :name => "MyString",
      :full_name => "MyString",
      :mes_level_id => 1,
      :precedence => 1
    ))
  end

  it "renders new mes_rank form" do
    render

    assert_select "form[action=?][method=?]", mes_ranks_path, "post" do

      assert_select "input#mes_rank_name[name=?]", "mes_rank[name]"

      assert_select "input#mes_rank_full_name[name=?]", "mes_rank[full_name]"

      assert_select "input#mes_rank_mes_level_id[name=?]", "mes_rank[mes_level_id]"

      assert_select "input#mes_rank_precedence[name=?]", "mes_rank[precedence]"
    end
  end
end
