class PagesController < ApplicationController
  def home
    @mealsall = Meal.all
    @meals = @mealsall[0..3]
  end
end
