require "rails_helper"

RSpec.describe GenericMastersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/generic_masters").to route_to("generic_masters#index")
    end

    it "routes to #new" do
      expect(:get => "/generic_masters/new").to route_to("generic_masters#new")
    end

    it "routes to #show" do
      expect(:get => "/generic_masters/1").to route_to("generic_masters#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/generic_masters/1/edit").to route_to("generic_masters#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/generic_masters").to route_to("generic_masters#create")
    end

    it "routes to #update" do
      expect(:put => "/generic_masters/1").to route_to("generic_masters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/generic_masters/1").to route_to("generic_masters#destroy", :id => "1")
    end

  end
end
