class Api::V1::PetsController < Api::V1::BaseController
  before_action :find_pet
  skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
    @pets = Pet.all
  end

  def show
  end

  def create
    @pet = Pet.new(permitted_params)
    @pet.user = current_user

    if @pet.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @pet.destroy
  end

  def edit
  end

  def update
    @pet.update(params[:pet])
  end

  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def permitted_params
    params.require(:pet).permit(:pet_name, :location, :description, :gender, photo:[])
  end
end
