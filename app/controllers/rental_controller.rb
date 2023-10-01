class RentalController < ApplicationController
  def index
    reder json: Rental.all
  end

  
end