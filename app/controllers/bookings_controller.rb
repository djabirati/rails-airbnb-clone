class BookingsController < ApplicationController
  before_action :set_booking, only: :destroy
  before_action :set_meal, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.meal = @meal
    @booking.total_price = @meal.price * @booking.number_customer
    @booking.status = "en attente de confirmation"
    @booking.user_id = current_user.id
    @booking.meal_id = @meal.id
    if @booking.save
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:date_hour, :number_customer, :status, :total_price, :meal_id, :user_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end
end
