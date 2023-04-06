require "rails_helper"

RSpec.describe AdminusersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/adminusers").to route_to("adminusers#index")
    end

    it "routes to #new" do
      expect(get: "/adminusers/new").to route_to("adminusers#new")
    end

    it "routes to #show" do
      expect(get: "/adminusers/1").to route_to("adminusers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/adminusers/1/edit").to route_to("adminusers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/adminusers").to route_to("adminusers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/adminusers/1").to route_to("adminusers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/adminusers/1").to route_to("adminusers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/adminusers/1").to route_to("adminusers#destroy", id: "1")
    end
  end
end
