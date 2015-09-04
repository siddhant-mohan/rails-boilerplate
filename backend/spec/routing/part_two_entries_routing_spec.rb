require "rails_helper"

RSpec.describe PartTwoEntriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/part_two_entries").to route_to("part_two_entries#index")
    end

    it "routes to #new" do
      expect(:get => "/part_two_entries/new").to route_to("part_two_entries#new")
    end

    it "routes to #show" do
      expect(:get => "/part_two_entries/1").to route_to("part_two_entries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/part_two_entries/1/edit").to route_to("part_two_entries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/part_two_entries").to route_to("part_two_entries#create")
    end

    it "routes to #update" do
      expect(:put => "/part_two_entries/1").to route_to("part_two_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/part_two_entries/1").to route_to("part_two_entries#destroy", :id => "1")
    end

  end
end
