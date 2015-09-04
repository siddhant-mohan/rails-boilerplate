require 'spec_helper'
require 'csv'

RSpec.describe Label, :type => :model do

  describe "check import from csv" do
    it "should parse 'label.csv' and display success or error messages from it" do
      path = "#{Rails.root}/spec/data/label.csv"
      File.exists? path
      expect {
        Label.import_from_csv path
      }.to change(Label, :count).by(6)
      expect(Label.all.length).to eq(6)
    end
  end


  describe "check import from csv with invalid headers" do
    it "should parse 'label_invalid_headers.csv' and display success or error messages from it" do
      path = "#{Rails.root}/spec/data/label_invalid_headers.csv"
      File.exists? path
      expect {
        Label.import_from_csv path
      }.to raise_error
      expect(Label.all.length).to eq(0)
    end
  end
end
