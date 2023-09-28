class Api::V1::HomeController < ApplicationController
  def index
    render json: { message: 'Welcome to our API' }, status: :ok
  end
end
