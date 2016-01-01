class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    if !logged_in?
      redirect_to root_path
    else
      @cars = Car.all
    end
  end

  def set_user
    #@user = User.find_by slug: params[:id]
    @user = User.find params[:id]
  end

end
