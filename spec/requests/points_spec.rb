require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/points", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Point. As you add validations to Point, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Point.create! valid_attributes
      get points_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      point = Point.create! valid_attributes
      get point_url(point)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_point_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      point = Point.create! valid_attributes
      get edit_point_url(point)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Point" do
        expect {
          post points_url, params: { point: valid_attributes }
        }.to change(Point, :count).by(1)
      end

      it "redirects to the created point" do
        post points_url, params: { point: valid_attributes }
        expect(response).to redirect_to(point_url(Point.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Point" do
        expect {
          post points_url, params: { point: invalid_attributes }
        }.to change(Point, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post points_url, params: { point: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested point" do
        point = Point.create! valid_attributes
        patch point_url(point), params: { point: new_attributes }
        point.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the point" do
        point = Point.create! valid_attributes
        patch point_url(point), params: { point: new_attributes }
        point.reload
        expect(response).to redirect_to(point_url(point))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        point = Point.create! valid_attributes
        patch point_url(point), params: { point: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested point" do
      point = Point.create! valid_attributes
      expect {
        delete point_url(point)
      }.to change(Point, :count).by(-1)
    end

    it "redirects to the points list" do
      point = Point.create! valid_attributes
      delete point_url(point)
      expect(response).to redirect_to(points_url)
    end
  end
end