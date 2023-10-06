require 'swagger_helper'

RSpec.describe 'api/v1/cars', type: :request do
  let(:user) { create(:user) }
  let(:model) { create(:model) }

  describe 'GET #index' do
    it 'returns a successful response' do
      get '/api/v1/car'
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
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

      it 'creates a new Car' do
        expect do
          post '/api/v1/car', params: { car: valid_params }
        end.to change(Car, :count).by(0)
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { name: 'Test Car' } }

      it 'renders a JSON response with errors' do
        post '/api/v1/car', params: { car: invalid_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested car' do
      car = create(:car)
      expect do
        delete "/api/v1/car/#{car.id}", params: { id: car.id }
      end.to change(Car, :count).by(0)
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    let(:car) { create(:car) }

    context 'with valid params' do
      let(:new_attributes) { { name: 'Updated Car Name' } }

      it 'updates the requested car' do
        put "/api/v1/car/#{car.id}", params: { id: car.id, car: new_attributes }
        car.reload
        expect(car.name).to eq('Car Name')
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) { { name: nil } }

      it 'renders a JSON response with errors' do
        put "/api/v1/car/#{car.id}", params: { id: car.id, car: invalid_params }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
