class CarController < applicationController
  def index
    render json: Car.all
  end
  
end