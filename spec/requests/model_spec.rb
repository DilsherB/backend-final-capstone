require 'rails_helper'

RSpec.describe 'Models', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/api/v1/model'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      post '/api/v1/model'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      delete '/api/v1/model/destroy'
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      put '/api/v1/model/edit'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
