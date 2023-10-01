class ModelController < applicationController
  def index
    render json: Model.all
  end

  def show
    render json: Model.find(params[:id])
  end

end