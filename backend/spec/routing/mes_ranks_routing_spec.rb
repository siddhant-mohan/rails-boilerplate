require "rails_helper"

RSpec.describe MesRanksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mes_ranks").to route_to("mes_ranks#index")
    end

    it "routes to #new" do
      expect(:get => "/mes_ranks/new").to route_to("mes_ranks#new")
    end

    it "routes to #show" do
      expect(:get => "/mes_ranks/1").to route_to("mes_ranks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/mes_ranks/1/edit").to route_to("mes_ranks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mes_ranks").to route_to("mes_ranks#create")
    end

    it "routes to #update" do
      expect(:put => "/mes_ranks/1").to route_to("mes_ranks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/mes_ranks/1").to route_to("mes_ranks#destroy", :id => "1")
    end

  end
end
