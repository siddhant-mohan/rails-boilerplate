require 'rails_helper'

RSpec.describe "AuthEntries", :type => :request do
  describe "GET /auth_entries" do
    it "works! (now write some real specs)" do
      get auth_entries_path
      expect(response).to have_http_status(200)
    end
  end
end
