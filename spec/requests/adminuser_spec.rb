require 'rails_helper'

RSpec.describe "Adminusers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/adminuser/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/adminuser/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/adminuser/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/adminuser/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
