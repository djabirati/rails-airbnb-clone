class DashboardsController < ApplicationController
  def show
    @user = current_user
    @meals = Meal.all
    @bookings = Booking.all
  end
end
