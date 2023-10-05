require 'rails_helper'

RSpec.describe 'Api::V1::Rentals', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/rentals/'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST /create' do
    it 'returns http success' do
      post '/api/v1/rentals/'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PATCH /update' do
    it 'returns http success' do
      patch '/api/v1/rentals/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      delete '/api/v1/rentals/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
