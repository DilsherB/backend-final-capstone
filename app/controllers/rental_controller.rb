class RentalController < ApplicationController
  def index
    reder json: Rental.all
  end

  def show
    render json: Rental.find(params[:id])
  end
end