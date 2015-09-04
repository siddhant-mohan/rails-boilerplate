require 'rails_helper'

RSpec.describe MesRank, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :precedence}
  it {is_expected.to respond_to :mes_level}
  it {is_expected.to respond_to :mes_level=}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:precedence)}
  it {is_expected.to validate_presence_of(:mes_level)}
  it {is_expected.to validate_uniqueness_of(:name)}

  it 'has a valid factory' do
    expect(FactoryGirl.build :mes_rank).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_mes_rank).not_to be_valid
  end
  it 'has one after adding one' do
    p = FactoryGirl.create :generic_master
    expect {
      FactoryGirl.create :mes_rank, :mes_level=> p
    }.to change {MesRank.count}.by(1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :mes_rank, :name => 'zinga'
    c2 = FactoryGirl.create :mes_rank, :name => 'paaro'
    expect(MesRank.search(:search => 'zinga')).to include(c1)
    expect(MesRank.search(:search => 'zin')).to include(c1)
    expect(MesRank.search(:search => 'zin')).not_to include(c2)
    expect(MesRank.search(:search => '').count).to eq(MesRank.count)
    expect(MesRank.search(:search => 'nil').count).to eq(0)
  end
end
