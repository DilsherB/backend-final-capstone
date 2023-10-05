require 'rails_helper'
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { 'password123' }
    name { 'test' }
    phone_number { '01245855' }
  end
end

RSpec.describe 'Api::V1::Cars', type: :request do
  # RSpec.describe Api::V1::CarController, type: :controller do
  let(:user) { create(:user) }
  let(:model) { create(:model) }
  let(:valid_attributes) do
    {
      name: 'Car Name',
      plate_number: 'ABC123',
      status: true,
      image: fixture_file_upload('test_image.jpg', 'image/jpg'),
      price: 100.00,
      city: 'City Name',
      user_id: user.id,
      model_id: model.id
    }
  end

  let(:invalid_attributes) do
    {
      name: 'Test',
      plate_number: 'ABC123',
      status: true,
      price: 100.00,
      city: 'City Name',
      user_id: user.id,
      model_id: model.id
    }
  end

  before do
    allow(controller).to receive(:current_devise_api_user) { user }
  end

  valid_token = 'Fake_token'

  describe 'GET #index' do
    it 'returns a success response' do
      Car.create!(valid_attributes)
      get '/', headers: { 'ACCEPT' => 'application/json' }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Car' do
        expect do
          post '/api/v1/car',
               params: { car: valid_attributes },
               headers: {
                 'ACCEPT' => 'application/json',
                 'Authorization' => "Bearer #{valid_token}"
               }
        end.to change(Car, :count).by(0)
      end

      it 'renders a JSON response with the new car' do
        post '/api/v1/car',
             params: { car: valid_attributes },
             headers: {
               'ACCEPT' => 'application/json',
               'Authorization' => "Bearer #{valid_token}"
             }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        post '/api/v1/car', params: { car: invalid_attributes }, headers: { 'ACCEPT' => 'application/json' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested car' do
      car = Car.create!(valid_attributes)
      expect do
        delete "/api/v1/car/#{car.id}", params: { id: car.to_param }, headers: { 'ACCEPT' => 'application/json' }
      end.to change(Car, :count).by(0)
    end

    it 'renders a JSON response with the car' do
      car = Car.create!(valid_attributes)
      delete "/api/v1/car/#{car.id}", params: { id: car.to_param },
                                      headers: {
                                        'ACCEPT' => 'application/json',
                                        'Authorization' => "Bearer #{valid_token}"
                                      }
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Car Name' } }

      it 'updates the requested car' do
        car = Car.create!(valid_attributes)
        put "/api/v1/car/#{car.id}", params: { id: car.to_param, car: new_attributes },
                                     headers: { 'ACCEPT' => 'application/json' }
        car.reload
        expect(car.name).to eq('Car Name')
      end

      it 'renders a JSON response with the updated car' do
        car = Car.create!(valid_attributes)
        put "/api/v1/car/#{car.id}", params: { id: car.to_param, car: valid_attributes },
                                     headers: { 'ACCEPT' => 'application/json' }
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors' do
        car = Car.create!(valid_attributes)
        put "/api/v1/car/#{car.id}",
            params: { id: car.to_param, car: invalid_attributes },
            headers: { 'ACCEPT' => 'application/json' }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
