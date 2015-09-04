require "rails_helper"

RSpec.describe MesAppointmentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mes_appointments").to route_to("mes_appointments#index")
    end

    it "routes to #new" do
      expect(:get => "/mes_appointments/new").to route_to("mes_appointments#new")
    end

    it "routes to #show" do
      expect(:get => "/mes_appointments/1").to route_to("mes_appointments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mes_appointments/1/edit").to route_to("mes_appointments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mes_appointments").to route_to("mes_appointments#create")
    end

    it "routes to #update" do
      expect(:put => "/mes_appointments/1").to route_to("mes_appointments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mes_appointments/1").to route_to("mes_appointments#destroy", :id => "1")
    end

  end
end
