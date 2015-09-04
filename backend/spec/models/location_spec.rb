require 'rails_helper'

RSpec.describe Location, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :state_id}
  it {is_expected.to respond_to :location_type}
  it {is_expected.to respond_to :state}
  it {is_expected.to respond_to :state=}
  it {is_expected.to respond_to :complex=}
  it {is_expected.to respond_to :complex}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:location_type)}
  it {is_expected.to validate_presence_of(:complex)}
  it { should validate_uniqueness_of(:name).scoped_to(:state_id,) }

  it 'has a valid factory' do
    expect(FactoryGirl.build :location).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_location).not_to be_valid
  end
  it 'has one after adding one' do
    expect {
      FactoryGirl.create :location
    }.to change {Location.count}.by(1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :location, :name => 'zinga'
    c2 = FactoryGirl.create :location, :name => 'paaro'
    expect(Location.search(:search => 'zinga')).to include(c1)
    expect(Location.search(:search => 'zin')).to include(c1)
    expect(Location.search(:search => 'zin')).not_to include(c2)
    expect(Location.search(:search => '').count).to eq(Location.count)
    expect(Location.search(:search => 'nil').count).to eq(0)
  end
end
