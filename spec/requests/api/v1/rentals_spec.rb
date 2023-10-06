require 'swagger_helper'
RSpec.describe 'api/v1/rentals', type: :request do
  let(:user) { create(:user) }
  let(:car) { create(:car) }
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new rental' do
        # Use FactoryBot or similar to create valid parameters
        valid_params = { rental_date: Date.today, destination: 'Destination' }
        expect do
          post :create, params: { car_id: car.id, rental: valid_params }
        end.to change(Rental, :count).by(1)
      end
    end
    context 'with invalid attributes' do
      it 'returns unprocessable_entity status' do
        # Create invalid parameters here
        invalid_params = { rental_date: nil, destination: nil }
        post :create, params: { car_id: car.id, rental: invalid_params }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
