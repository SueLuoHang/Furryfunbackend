class Api::V1::BookingsController < Api::V1::BaseController
  before_action :find_service
  before_action :find_booking
  def show
  end


  def create
    if @booking.time.include? time_params
      render_error
    else
      @booking = Booking[time: booking_params, status: completed]
      @booking.service = @service
      @booking.user = current_user
      @booking.save
    end
  end

  def destroy
    @booking.destroy
  end

  private

  def find_service
    @service = Service.find(params[:service_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:time)
  end
end
