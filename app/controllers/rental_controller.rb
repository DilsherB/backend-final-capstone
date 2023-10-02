class RentalController < ApplicationController
  def index
    render json: Rental.all
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

  def update
    render json: Rental.update(params[:id], rental_params)
  end

  def destroy
    render json: Rental.destroy(params[:id])
  end

  private

  def rental_params
    params.require(:rental).permit(:rental_number, :rental_date, :time_depart, :time_arrive, :date_return)
  end
end
