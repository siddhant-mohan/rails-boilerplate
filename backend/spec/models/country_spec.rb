require 'rails_helper'

RSpec.describe Country, :type => :model do
  it {is_expected.to respond_to :name}
  it {is_expected.to respond_to :full_name}
  it {is_expected.to respond_to :states}
  it {is_expected.to respond_to :states=}
  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_uniqueness_of(:name)}

  it 'has a valid factory' do
    expect(FactoryGirl.build :country).to be_valid
  end
  it 'has an invalid factory' do
    expect(FactoryGirl.build :invalid_country).not_to be_valid
  end
  it 'has one after adding one' do
    expect {
      FactoryGirl.create :country
    }.to change {Country.count}.by(1)
  end
  it 'respond to search' do
    c1 = FactoryGirl.create :country, :name => 'japan'
    c2 = FactoryGirl.create :country, :name => 'india'
    expect(Country.search(:search => 'india')).to include(c2)
    expect(Country.search(:search => 'ind')).to include(c2)
    expect(Country.search(:search => 'ind')).not_to include(c1)
    expect(Country.search(:search => '').count).to eq(Country.count)
    expect(Country.search(:search => 'nil').count).to eq(0)
  end
end
