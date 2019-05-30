class DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: :account

  def account
    @gardens = Garden.where(user_id: current_user)
    byebug
    if @gardens == []
      current_user.bookings.each do |booking|
        @gardens << booking.garden
      end
      authorize @gardens
    else
      authorize @gardens
    end
  end
end
