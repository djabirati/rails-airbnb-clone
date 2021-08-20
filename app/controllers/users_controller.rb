class UsersController < ApplicationController

  def update
    @user = current_user
    @user.is_cheff = params[:is_cheff]
    @user.save
  end
end
