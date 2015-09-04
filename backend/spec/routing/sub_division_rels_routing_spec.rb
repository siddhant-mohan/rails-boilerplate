require "rails_helper"

RSpec.describe SubDivisionRelsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_division_rels").to route_to("sub_division_rels#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_division_rels/new").to route_to("sub_division_rels#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_division_rels/1").to route_to("sub_division_rels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_division_rels/1/edit").to route_to("sub_division_rels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_division_rels").to route_to("sub_division_rels#create")
    end

    it "routes to #update" do
      expect(:put => "/sub_division_rels/1").to route_to("sub_division_rels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_division_rels/1").to route_to("sub_division_rels#destroy", :id => "1")
    end

  end
end
