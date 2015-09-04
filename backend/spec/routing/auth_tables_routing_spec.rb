require "rails_helper"

RSpec.describe AuthTablesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/auth_tables").to route_to("auth_tables#index")
    end

    it "routes to #new" do
      expect(:get => "/auth_tables/new").to route_to("auth_tables#new")
    end

    it "routes to #show" do
      expect(:get => "/auth_tables/1").to route_to("auth_tables#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/auth_tables/1/edit").to route_to("auth_tables#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/auth_tables").to route_to("auth_tables#create")
    end

    it "routes to #update" do
      expect(:put => "/auth_tables/1").to route_to("auth_tables#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/auth_tables/1").to route_to("auth_tables#destroy", :id => "1")
    end

  end
end
