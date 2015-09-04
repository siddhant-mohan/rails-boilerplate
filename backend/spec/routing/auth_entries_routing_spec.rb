require "rails_helper"

RSpec.describe AuthEntriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/auth_entries").to route_to("auth_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/auth_entries/new").to route_to("auth_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/auth_entries/1").to route_to("auth_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/auth_entries/1/edit").to route_to("auth_entries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/auth_entries").to route_to("auth_entries#create")
    end

    it "routes to #update" do
      expect(:put => "/auth_entries/1").to route_to("auth_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/auth_entries/1").to route_to("auth_entries#destroy", :id => "1")
    end

  end
end
