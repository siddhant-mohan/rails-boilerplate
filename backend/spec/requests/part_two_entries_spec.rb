require 'rails_helper'

RSpec.describe "PartTwoEntries", :type => :request do
  describe "GET /part_two_entries" do
    it "works! (now write some real specs)" do
      get part_two_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
