class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_service
  def show
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.service = @service
    @booking.user = current_user
    @booking.save
  end

  def destroy
    @booking.destroy
  end

  def valid?

  end

  private

  def find_service
    @service = Service.find(params[:service_id])
  end

  def booking_params
    params.require(:user_id).permit(:service_id)
  end

end
