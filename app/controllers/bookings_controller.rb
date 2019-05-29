class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new
  end

  def create
  @start_date = Date.civil(booking_params[:"start_date(1i)"].to_i,
                         booking_params[:"start_date(2i)"].to_i,
                         booking_params[:"start_date(3i)"].to_i)

  @end_date   = Date.civil(booking_params[:"end_date(1i)"].to_i,
                         booking_params[:"end_date(2i)"].to_i,
                         booking_params[:"end_date(3i)"].to_i)
    # start_date = "#{booking_params[start_date(li1)]}/#{booking_params[start_date(li2)]}/#{booking_params[start_date(li3)]}"
    # Date.parse start_date
    # end_date = "#{booking_params[end_date(li1)]}/#{booking_params[end_date(li2)]}/#{booking_params[end_date(li3)]}"
    # Date.parse end_date
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new(start_date: @start_date, end_date: @end_date)
    @booking.garden = @garden
    @booking.user = User.find(7)

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
