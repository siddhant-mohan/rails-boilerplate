require 'rails_helper'

RSpec.describe "AuthTables", :type => :request do
  describe "GET /auth_tables" do
    it "works! (now write some real specs)" do
      get auth_tables_path
      expect(response).to have_http_status(200)
    end
  end
end
