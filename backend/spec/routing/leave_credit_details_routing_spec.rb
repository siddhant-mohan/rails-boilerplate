require "rails_helper"

RSpec.describe LeaveCreditDetailsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leave_credit_details").to route_to("leave_credit_details#index")
    end

    it "routes to #new" do
      expect(:get => "/leave_credit_details/new").to route_to("leave_credit_details#new")
    end

    it "routes to #show" do
      expect(:get => "/leave_credit_details/1").to route_to("leave_credit_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/leave_credit_details/1/edit").to route_to("leave_credit_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/leave_credit_details").to route_to("leave_credit_details#create")
    end

    it "routes to #update" do
      expect(:put => "/leave_credit_details/1").to route_to("leave_credit_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/leave_credit_details/1").to route_to("leave_credit_details#destroy", :id => "1")
    end

  end
end
