require 'rails_helper'

RSpec.describe "Models", type: :request do
  describe "GET /create" do
    it "returns http success" do
      get "/model/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/model/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/model/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
