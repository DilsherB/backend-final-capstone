require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /create' do
    it 'returns http 404' do
      post '/api/v1/users'
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'GET /destroy' do
    it 'returns http 404' do
      delete '/api/v1/users/:id'
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'GET /update' do
    it 'returns http 404' do
      patch '/api/v1/users/:id'
      expect(response).to have_http_status(:no_content)
    end
  end

  describe 'GET /put' do
    it 'returns http 404' do
      patch '/api/v1/users/:id'
      expect(response).to have_http_status(:no_content)
    end
  end
end
