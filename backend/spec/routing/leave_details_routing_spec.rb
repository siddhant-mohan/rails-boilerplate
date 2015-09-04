require "rails_helper"

RSpec.describe LeaveDetailsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leave_details").to route_to("leave_details#index")
    end

    it "routes to #new" do
      expect(:get => "/leave_details/new").to route_to("leave_details#new")
    end

    it "routes to #show" do
      expect(:get => "/leave_details/1").to route_to("leave_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leave_details/1/edit").to route_to("leave_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leave_details").to route_to("leave_details#create")
    end

    it "routes to #update" do
      expect(:put => "/leave_details/1").to route_to("leave_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leave_details/1").to route_to("leave_details#destroy", :id => "1")
    end

  end
end
