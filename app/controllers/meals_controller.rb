class MealsController < ApplicationController

  def index
    @meals = Meal.all

    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    unless @meals == []
      @markers = @meals.geocoded.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { meal: meal })
      }
      end
    end
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.user_id = current_user.id
    @meal.address = current_user.address
    if @meal.save
      redirect_to meals_path
    else
      render :new
    end
  end

  def show
    @meal = Meal.find(params[:id])
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :category, :description, :price, :photo)
  end
end
