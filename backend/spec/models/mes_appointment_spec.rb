require 'rails_helper'

RSpec.describe MesAppointment, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :precedence}
  it {is_expected.to respond_to :mes_appointment_level}
  it {is_expected.to respond_to :mes_appointment_level=}
  it {is_expected.to respond_to :mes_level}
  it {is_expected.to respond_to :mes_level=}
  it {is_expected.to respond_to :cadre}
  it {is_expected.to respond_to :cadre=}
  it {is_expected.to respond_to :trade}
  it {is_expected.to respond_to :trade=}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:precedence)}
  it {is_expected.to validate_presence_of(:mes_level)}
  it {is_expected.to validate_presence_of(:cadre)}
  it {is_expected.to validate_presence_of(:trade)}
  it {is_expected.to validate_presence_of(:mes_appointment_level)}
  it {is_expected.to validate_uniqueness_of(:name)}

  it 'has a valid factory' do
    expect(FactoryGirl.build :mes_appointment).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_mes_appointment).not_to be_valid
  end
  it 'has one after adding one' do
    expect {
      FactoryGirl.create :mes_appointment
    }.to change {MesAppointment.count}.by(1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :mes_appointment, :name => 'zinga'
    c2 = FactoryGirl.create :mes_appointment, :name => 'paaro'
    expect(MesAppointment.search(:search => 'zinga')).to include(c1)
    expect(MesAppointment.search(:search => 'zin')).to include(c1)
    expect(MesAppointment.search(:search => 'zin')).not_to include(c2)
    expect(MesAppointment.search(:search => '').count).to eq(MesAppointment.count)
    expect(MesAppointment.search(:search => 'nil').count).to eq(0)
  end
end

