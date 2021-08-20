class DashboardsController < ApplicationController
  def show
    # @user = current_user.id
    @user = User.find(params[:id])
    @meals = Meal.all
    @bookings = Booking.all
  end
end
