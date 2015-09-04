require "rails_helper"

RSpec.describe ArmyRanksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/army_ranks").to route_to("army_ranks#index")
    end

    it "routes to #new" do
      expect(:get => "/army_ranks/new").to route_to("army_ranks#new")
    end

    it "routes to #show" do
      expect(:get => "/army_ranks/1").to route_to("army_ranks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/army_ranks/1/edit").to route_to("army_ranks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/army_ranks").to route_to("army_ranks#create")
    end

    it "routes to #update" do
      expect(:put => "/army_ranks/1").to route_to("army_ranks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/army_ranks/1").to route_to("army_ranks#destroy", :id => "1")
    end

  end
end
