class Api::V1::PetsController < Api::V1::BaseController
  before_action :find_pet, only: [:show, :destroy, :edit, :update, :update_photo]
  skip_before_action :authenticate_user!, only: [:index], raise: false

  def index
    @pets = Pet.all
    @services = Service.all
  end

  def show
  end

  def create
    @pet = Pet.new(permitted_params)
    current_user = User.find(params[:user_id])
    @pet.user = current_user

    if @pet.save
      render :create, status: :created
    else
      render json: {status: 500, msg: "Pet Created Fail!"}
    end
  end

  def destroy
    @pet.destroy
  end

  def edit
  end

  def update
    p @pet
    puts "=======update======"
    params.require(:pet).permit!
    pet_info = params[:pet]
    p pet_info
    @pet.pet_name = pet_info[:pet_name]
    @pet.description = pet_info[:description]
    @pet.gender = pet_info[:gender]
    @pet.location = pet_info[:location[]]
    @pet.pet_type = pet_info[:pet_type]
    @pet.title = pet_info[:title]
    @pet.save!
  end

  def update_photo
    puts params
    puts "======================================"
    photo = params[:petPhoto]
    @pet.photo.attach(photo)
    render json: {status: 200, msg: "Photo attached"} if @pet.save
    puts "---------------ERROR-----------------"
  end



  private

  def find_pet
    @pet = Pet.find(params[:id])
  end

  def render_error
    render json: { errors: @pet.errors.full_messages },
      status: :unprocessable_entity

  end
end
