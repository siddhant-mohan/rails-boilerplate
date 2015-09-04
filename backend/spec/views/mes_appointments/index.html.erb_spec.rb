require 'rails_helper'

RSpec.describe "mes_appointments/index", :type => :view do
  before(:each) do
    assign(:mes_appointments, [
      MesAppointment.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mes_level_id => 1,
        :cadre_id => 2,
        :trade_id => 3,
        :precedence => 4,
        :mes_appointment_level_id => 5
      ),
      MesAppointment.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mes_level_id => 1,
        :cadre_id => 2,
        :trade_id => 3,
        :precedence => 4,
        :mes_appointment_level_id => 5
      )
    ])
  end

  it "renders a list of mes_appointments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
