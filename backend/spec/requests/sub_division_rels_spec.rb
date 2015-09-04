require 'rails_helper'

RSpec.describe "SubDivisionRels", :type => :request do
  describe "GET /sub_division_rels" do
    it "works! (now write some real specs)" do
      get sub_division_rels_path
      expect(response).to have_http_status(200)
    end
  end
end
