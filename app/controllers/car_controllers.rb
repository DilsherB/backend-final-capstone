class CarController < applicationController
  def index
    render json: Car.all
  end

  def show
    render json: Car.find(params[:id])
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: car, status: :created
    else
      render json: car.errors, status: :unprocessable_entity
    end
  end
  
  def update
    render json: Car.update(params[:id], car_params)
  end

  def destroy
    render json: Car.destroy(params[:id])
  end

  private

  def car_params
    params.require(:car).permit(:license_plate, :status, :name, :image, :price)
  end

  
end