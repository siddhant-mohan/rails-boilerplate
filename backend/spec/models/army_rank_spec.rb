require 'rails_helper'

RSpec.describe ArmyRank, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :precedence}
  it {is_expected.to respond_to :military_level}
  it {is_expected.to respond_to :military_level=}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:precedence)}
  it {is_expected.to validate_presence_of(:military_level_id)}
  it {is_expected.to validate_uniqueness_of(:name)}

  it 'has a valid factory' do
    expect(FactoryGirl.build :army_rank).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_army_rank).not_to be_valid
  end
  it 'has one after adding one' do
    p = FactoryGirl.create :military_level
    expect {
      FactoryGirl.create :army_rank, :military_level=> p
    }.to change {ArmyRank.count}.by(1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :army_rank, :name => 'zinga'
    c2 = FactoryGirl.create :army_rank, :name => 'paaro'
    expect(ArmyRank.search(:search => 'zinga')).to include(c1)
    expect(ArmyRank.search(:search => 'zin')).to include(c1)
    expect(ArmyRank.search(:search => 'zin')).not_to include(c2)
    expect(ArmyRank.search(:search => '').count).to eq(ArmyRank.count)
    expect(ArmyRank.search(:search => 'nil').count).to eq(0)
  end
end

