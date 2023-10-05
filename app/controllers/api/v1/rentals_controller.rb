class Api::V1::RentalsController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @rentals = current_devise_api_user.rentals
    render json: @rentals.to_json
  end

  def create
    @car = Car.find_by(id: params['car_id'].to_i)
    @rental = Rental.new(rental_params)
    @rental.user = current_devise_api_user
    @rental.car = @car
    @rental.rental_number = SecureRandom.uuid

    if @car.nil?
      render json: { message: 'Invalid Car' }, status: :no_content
    elsif @rental.save
      update_car_status(params['car_id'].to_i)
      render json: @rental.to_json, status: :created
    else
      render json: @rental.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    @rental = current_devise_api_user.rentals.find_by(id: params['id'].to_i)
    @car = Car.find_by(id: params['car_id'].to_i)
    @rental.car = @car

    if @rental.nil?
      render json: { name: 'unavailable rental' }, status: :no_content
    elsif @rental.update(rental_params)
      render json: @rental.to_json, status: :ok
    else
      render json: @rental.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    @rental = current_devise_api_user.rentals.find(params['id'].to_i)
    if @rental.destroy
      render json: @rental.to_json, status: :ok
    else
      render json: @rental.errors.to_json, status: :unprocessable_entity
    end
  end

  private

  def update_car_status(id)
    @car = Car.find(id.to_i)
    @car.status = false
    Car.find(id).update(status: false)
  end

  def rental_params
    params.permit(:rental_date, :destination, :date_return)
  end
end
