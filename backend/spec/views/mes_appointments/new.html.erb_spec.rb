require 'rails_helper'

RSpec.describe "mes_appointments/new", :type => :view do
  before(:each) do
    assign(:mes_appointment, MesAppointment.new(
      :name => "MyString",
      :full_name => "MyString",
      :mes_level_id => 1,
      :cadre_id => 1,
      :trade_id => 1,
      :precedence => 1,
      :mes_appointment_level_id => 1
    ))
  end

  it "renders new mes_appointment form" do
    render

    assert_select "form[action=?][method=?]", mes_appointments_path, "post" do

      assert_select "input#mes_appointment_name[name=?]", "mes_appointment[name]"

      assert_select "input#mes_appointment_full_name[name=?]", "mes_appointment[full_name]"

      assert_select "input#mes_appointment_mes_level_id[name=?]", "mes_appointment[mes_level_id]"

      assert_select "input#mes_appointment_cadre_id[name=?]", "mes_appointment[cadre_id]"

      assert_select "input#mes_appointment_trade_id[name=?]", "mes_appointment[trade_id]"

      assert_select "input#mes_appointment_precedence[name=?]", "mes_appointment[precedence]"

      assert_select "input#mes_appointment_mes_appointment_level_id[name=?]", "mes_appointment[mes_appointment_level_id]"
    end
  end
end
