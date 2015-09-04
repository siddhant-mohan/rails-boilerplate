require 'rails_helper'

RSpec.describe "LocationRels", :type => :request do
  describe "GET /location_rels" do
    it "works! (now write some real specs)" do
      get location_rels_path
      expect(response).to have_http_status(200)
    end
  end
end
