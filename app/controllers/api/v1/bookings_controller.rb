class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_pet, only: [:show], raise: false
  before_action :find_booking, only: [:show, :destroy], raise: false

  def show
  end

  def index
    @bookings = Booking.all
  end

  def create
    if @booking.time.include? booking_params
      render_error
    else
      @booking = Booking.new(booking_params)
      @booking.pet_id = pet_id
      @booking.user = current_user
      @booking.save
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
    params.require(:booking).permit(:time, status: completed)
  end
end
