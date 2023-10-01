class Api::V1::ModelController < ApplicationController
  before_action :authenticate_devise_api_token!

  def index
    @car_models = Model.all
    render json: @car_model.to_json, status: :ok
  end

  def create
    @car_model = Model.new(model_name: params[:model_name])

    render json: car_model.to_json, status: :created if @car_model.save
    render json: car_model, status: :unprocessable_entity
  end

  def destroy; end

  def update; end

  private

  def model_params
    params.require(:model).permit(:model_name, :year, :manufacturer)
  end
end
