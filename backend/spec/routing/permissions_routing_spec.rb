require "rails_helper"

RSpec.describe PermissionsController, :type => :routing do
	describe "routing" do

		it "routes to #index" do
			expect(:get => "/permissions").to route_to("permissions#index")
		end
	end
end
