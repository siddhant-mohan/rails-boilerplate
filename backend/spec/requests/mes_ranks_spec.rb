require 'rails_helper'

RSpec.describe "MesRanks", :type => :request do
  describe "GET /mes_ranks" do
    it "works! (now write some real specs)" do
      get mes_ranks_path
      expect(response).to have_http_status(200)
    end
  end
end
