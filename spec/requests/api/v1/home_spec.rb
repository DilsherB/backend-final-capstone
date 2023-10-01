require 'rails_helper'

RSpec.describe 'Api::V1::Homes', type: :request do
  describe 'GET /' do
    it 'GET /' do
      get root_path
      expect(response).to have_http_status(:ok)
    end
    it 'GET /api/v1/' do
      get api_v1_path
      expect(response).to have_http_status(:ok)
    end
    it 'GET /api/v1/home' do
      get api_v1_home_path
      expect(response).to have_http_status(:ok)
    end
  end
end
