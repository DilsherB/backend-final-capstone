class Api::V1::CarController < ApplicationController
  before_action :authenticate_devise_api_token!, only: %i[create update destroy]
  def index
    @cars = Car.all
    render json: format(CarSerializer.new(@cars).serializable_hash[:data]), status: :ok
  end

  def create
    @model = Model.find_by(id: params['model_id'].to_i)
    @car = Car.new(car_params)
    @car.user = current_devise_api_user
    @car.model = @model

    if @model.nil?
      render json: { message: 'Invalid model ID' }, status: :no_content
    elsif @car.save
      render json: CarSerializer.new(@car).serializable_hash[:data][:attributes], status: :created
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params['id'].to_i)
    if @car.destroy
      render json: CarSerializer.new(@car).serializable_hash[:data][:attributes], status: :ok
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find_by(id: params['id'].to_i)
    if @car.nil?
      render json: { name: 'unavailable car' }, status: :no_content
    elsif @car.update(car_params)
      render json: CarSerializer.new(@car).serializable_hash[:data][:attributes], status: :ok
    else
      render json: @car.errors.to_json, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.permit(:name, :plate_number, :status, :image, :price, :city)
  end

  def format(hash)
    output = []
    hash.each do |element|
      output << element[:attributes]
    end
    output
  end
end
