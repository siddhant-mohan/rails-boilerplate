require 'rails_helper'

RSpec.describe "GenericMasters", :type => :request do
  describe "GET /generic_masters" do
    it "works! (now write some real specs)" do
      get generic_masters_path
      expect(response).to have_http_status(200)
    end
  end
end
