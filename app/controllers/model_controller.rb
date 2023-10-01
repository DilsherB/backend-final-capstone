class ModelController < applicationController
  def index
    render json: Model.all
  end

  def show
    render json: Model.find(params[:id])
  end

  def create
    model = Model.new(model_params)
    if model.save
      render json: model, status: :created
    else
      render json: model.errors, status: :unprocessable_entity
    end
  end

  def update
    render json: model.update(params[:id], model_params)
  end

  private

  def model_params
    params.require(:model).permit(:name, :year, :manufacturer, :image)
  end

end