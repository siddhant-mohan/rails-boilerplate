require 'rails_helper'

RSpec.describe State, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :country}
  it {is_expected.to respond_to :country=}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:country)}
  it { should validate_uniqueness_of(:name).scoped_to(:country_id,) }


  it 'has a valid factory' do
    expect(FactoryGirl.build :state).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_state).not_to be_valid
  end
  it 'has one after adding one' do
    p = FactoryGirl.create :country
    c1 = p.states.count
    expect {
      FactoryGirl.create :state, :country=> p
    }.to change {State.count}.by(1)
    p.reload
    c2 = p.states.count
    expect(c2).to eq(c1+1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :state, :name => 'zinga'
    c2 = FactoryGirl.create :state, :name => 'paaro'
    expect(State.search(:search => 'zinga')).to include(c1)
    expect(State.search(:search => 'zin')).to include(c1)
    expect(State.search(:search => 'zin')).not_to include(c2)
    expect(State.search(:search => '').count).to eq(State.count)
    expect(State.search(:search => 'nil').count).to eq(0)
  end
end
