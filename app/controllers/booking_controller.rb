class BookingController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = booking.new(booking_params)
    if @booking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @garden_id = @booking.garden_id
    @booking.destroy
    redirect_to garden_path(@garden_id)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
