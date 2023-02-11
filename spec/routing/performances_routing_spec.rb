require "rails_helper"

RSpec.describe PerformancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/performances").to route_to("performances#index")
    end

    it "routes to #new" do
      expect(get: "/performances/new").to route_to("performances#new")
    end

    it "routes to #show" do
      expect(get: "/performances/1").to route_to("performances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/performances/1/edit").to route_to("performances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/performances").to route_to("performances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/performances/1").to route_to("performances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/performances/1").to route_to("performances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/performances/1").to route_to("performances#destroy", id: "1")
    end
  end
end
