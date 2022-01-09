class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_pet, only: [:show], raise: false
  before_action :find_booking, only: [:show, :destroy], raise: false

  def show
  end

  def index
    @bookings = Booking.all
  end

  def create
    booking_time = params[:booking]
    time = booking_time[:time]
    pet_id = booking_time[:pet_id]
    p "======123====="
    p time
    p "=======finish====="
    p pet_id
    current_user = User.find(params[:user_id])

    @bookings = Booking.all
    p @bookings
    bookings_time = []
    @bookings.each do |booking|
      bookings_time << booking.time
    end

    if bookings_time.include? time
      render json: {
        message: "this time has already booked"
      }

    else
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.pet_id = pet_id
      @booking.save!
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def find_pet
    @pet = Pet.find(params[:pet_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:time, :pet_id, :user_id)
  end
end
