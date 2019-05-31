class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :account

  def account
    @gardens = Garden.where(user_id: current_user)
    if @gardens == []
      @gardens = []
      @bookings = []
      current_user.bookings.each do |booking|
        @gardens << booking.garden
        @bookings << booking
      end
      @company = true
      authorize @gardens
    else
      @company = false
      @bookings = Booking.all
      authorize @gardens
    end
  end
end
