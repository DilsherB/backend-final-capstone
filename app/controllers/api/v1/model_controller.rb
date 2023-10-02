class Api::V1::ModelController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @car_models = Model.all
    render json: @car_models.to_json, status: :ok
  end

  def create
    @car_model = Model.new(model_params)

    if @car_model.save
      render json: @car_model.to_json, status: :created
    else
      render json: @car_model.errors.to_json, status: :unprocessable_entity
    end
  end

  def destroy
    @car_model = Model.find(params['id'])
    if @car_model.destroy
      render json: @car_model.to_json, status: :ok
    else
      render json: @car_model.errors.to_json, status: :unprocessable_entity
    end
  end

  def update
    @car_model = Model.find_by(id: params['id'])
    if @car_model.nil?
      render json: { name: 'unavailable model' }, status: :no_content
    elsif @car_model.update(model_params)
      render json: @car_model.to_json, status: :ok
    else
      render json: @car_model.errors.to_json, status: :unprocessable_entity
    end
  end

  private

  def model_params
    params.permit(:name, :year, :manufacturer, :logo)
  end
end
