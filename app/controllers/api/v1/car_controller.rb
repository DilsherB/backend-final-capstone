class Api::V1::CarController < ApplicationController
  before_action :authenticate_devise_api_token!, only: %i[create update destroy]
  def index
    @cars = Car.all
    render json: @cars.to_json, status: :ok
  end

  def create
    @model = Model.find_by(id: params['model_id'])
    @car = Car.new(car_params)
    @car.user = current_devise_api_user
    @car.model = @model

    if @car.save
      render json: @car.to_json, status: :created
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params['id'])
    if @car.destroy
      render json: @car.to_json, status: :ok
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find_by(id: params['id'])
    if @car.nil?
      render json: { name: 'unavailable car' }, status: :no_content
    elsif @car.update(car_params)
      render json: @car.to_json, status: :ok
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.permit(:plate_number, :status, :image, :price, :city)
  end
end
