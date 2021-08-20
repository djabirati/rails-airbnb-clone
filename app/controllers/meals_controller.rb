class MealsController < ApplicationController
  def index
    @meals = Meal.all
    @results = @meals
    @search = params["search"]
    if @search.present?
      @city = @search["city"]
      @type = @search["type"]
      @results = recherche(@city, @type)
    end
    @markers = mark(@results)
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.new(meal_params)
    Meal.reindex
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

  def edit
    @meal = Meal.find(params[:id])
  end

  def update
    @meal = Meal.find(params[:id])
    @meal.update(meal_params)
    redirect_to meals_path
    # redirect_to dashboard: id: current_user.id
  end

  private

  def meal_params
    params.require(:meal).permit(:title, :category, :description, :price, :photo)
  end

  def mark(meals)
    markers = meals.map do |meal|
      {
        lat: meal.latitude,
        lng: meal.longitude,
        info_window: render_to_string(partial: "info_window", locals: { meal: meal })
      }
    end
    return markers
  end

  def recherche(city, type)
    results = []
    types = Meal.search(type)
    citys = Meal.near(city, 10)
    if city != "" && type != ""
      types.map { |meal| results << meal if citys.include?(meal) }
    elsif city == ""
      results = types
    else
      results = citys
    end
    return results
  end
end
