require 'rails_helper'

RSpec.describe "LeaveCreditDetails", :type => :request do
  describe "GET /leave_credit_details" do
    it "works! (now write some real specs)" do
      get leave_credit_details_path
      expect(response).to have_http_status(200)
    end
  end
end
