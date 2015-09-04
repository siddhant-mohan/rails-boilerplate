require "rails_helper"

RSpec.describe LocationRelsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/location_rels").to route_to("location_rels#index")
    end

    it "routes to #new" do
      expect(:get => "/location_rels/new").to route_to("location_rels#new")
    end

    it "routes to #show" do
      expect(:get => "/location_rels/1").to route_to("location_rels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/location_rels/1/edit").to route_to("location_rels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/location_rels").to route_to("location_rels#create")
    end

    it "routes to #update" do
      expect(:put => "/location_rels/1").to route_to("location_rels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/location_rels/1").to route_to("location_rels#destroy", :id => "1")
    end

  end
end
