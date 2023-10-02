require 'rails_helper'

RSpec.describe 'Api::V1::Cars', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/car'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/api/v1/car/'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/api/v1/car/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH /edit' do
    it 'returns http success' do
      patch '/api/v1/car/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
