require 'rails_helper'

RSpec.describe "mes_appointments/show", :type => :view do
  before(:each) do
    @mes_appointment = assign(:mes_appointment, MesAppointment.create!(
      :name => "Name",
      :full_name => "Full Name",
      :mes_level_id => 1,
      :cadre_id => 2,
      :trade_id => 3,
      :precedence => 4,
      :mes_appointment_level_id => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
