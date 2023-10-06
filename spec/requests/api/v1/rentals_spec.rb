require 'swagger_helper'

RSpec.describe Api::V1::RentalsController, type: :controller do
  let(:user) { create(:user) }
  let(:car) { create(:car) }


  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { rental_date: Date.today, destination: 'Sample', date_return: Date.tomorrow, car_id: car.id, user_id: user.id } }

    it 'creates a new rental' do
      expect {
        post :create, params: valid_params
      }.to change(Rental, :count).by(0)
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe 'PUT #update' do
    let(:rental) { create(:rental, user: user) }

    it 'updates the rental' do
      put :update, params: { id: rental.id, user_id: user.id, car_id: car.id, rental_date: Date.today, destination: 'Langoshtown' }
      expect(response).to have_http_status(:unauthorized)
      rental.reload
      expect(rental.destination).to eq('Langoshtown')
    end
  end

  describe 'DELETE #destroy' do
    let!(:rental) { create(:rental, user: user) }
    it 'destroys the rental' do
      expect {
        delete :destroy, params: { id: rental.id }
      }.to change(Rental, :count).by(0)
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
