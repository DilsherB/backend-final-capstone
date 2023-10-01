class ModelController < applicationController
  def index
    render json: Model.all
  end

end