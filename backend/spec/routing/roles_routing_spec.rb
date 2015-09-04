require "rails_helper"

RSpec.describe RolesController, :type => :routing do
	describe "routing" do

		it "routes to #index" do
			expect(:get => "/roles").to route_to("roles#index")
		end

		it "routes to #new" do
			expect(:get => "/roles/new").to route_to("roles#new")
		end

		it "routes to #show" do
			expect(:get => "/roles/1").to route_to("roles#show", :id => "1")
		end

		it "routes to #edit" do
			expect(:get => "/roles/1/edit").to route_to("roles#edit", :id => "1")
		end

		it "routes to #create" do
			expect(:post => "/roles").to route_to("roles#create")
		end

		it "routes to #update" do
			expect(:put => "/roles/1").to route_to("roles#update", :id => "1")
		end

		it "routes to #destroy" do
			expect(:delete => "/roles/1").to route_to("roles#destroy", :id => "1")
		end

		it "routes to #assign_permission" do
			expect(:post => "/roles/assign_permission").to route_to("roles#assign_permission")
		end

		it "routes to #revoke_permission" do
			expect(:delete => "/roles/revoke_permission").to route_to("roles#revoke_permission")
		end

	end
end
