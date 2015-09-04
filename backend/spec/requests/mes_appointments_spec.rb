require 'rails_helper'

RSpec.describe "MesAppointments", :type => :request do
  describe "GET /mes_appointments" do
    it "works! (now write some real specs)" do
      get mes_appointments_path
      expect(response).to have_http_status(200)
    end
  end
end
