require 'rails_helper'

RSpec.describe "mes_ranks/edit", :type => :view do
  before(:each) do
    @mes_rank = assign(:mes_rank, MesRank.create!(
      :name => "MyString",
      :full_name => "MyString",
      :mes_level_id => 1,
      :precedence => 1
    ))
  end

  it "renders the edit mes_rank form" do
    render

    assert_select "form[action=?][method=?]", mes_rank_path(@mes_rank), "post" do

      assert_select "input#mes_rank_name[name=?]", "mes_rank[name]"

      assert_select "input#mes_rank_full_name[name=?]", "mes_rank[full_name]"

      assert_select "input#mes_rank_mes_level_id[name=?]", "mes_rank[mes_level_id]"

      assert_select "input#mes_rank_precedence[name=?]", "mes_rank[precedence]"
    end
  end
end
