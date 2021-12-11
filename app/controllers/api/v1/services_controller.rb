class Api::V1::ServicesController < Api::V1::BaseController
  before_action :find_service, only: [:show, :destroy, :update, :edit]
  skip_before_action :authenticate_user!, only: :index, raise:false

  def index
    @services = Service.all
  end

  def show
  end

  def create
    @service = Service.create(permitted_params)
    @service.save
  end

  def destroy
    @service.destroy
  end

  def edit
  end

  def update
    @service.update(params[:service])
  end

  private

  def find_service
    @service = Service.find(params[:id])
  end

  def permitted_params
    params.require(:service).permit(:title, :description)
  end
end
