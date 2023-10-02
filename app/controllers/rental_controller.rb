class RentalController < ApplicationController
  def index
    reder json: Rental.all
  end

  def show
    render json: Rental.find(params[:id])
  end

  def create
    rental = Rental.new(rental_params)
    if rental.save
      render json: rental, status: :created
    else
      render json: rental.errors, status: :unprocessable_entity
    end
  end
end
