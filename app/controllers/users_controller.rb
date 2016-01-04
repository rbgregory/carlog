class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]

  def show
    if !logged_in?
      redirect_to root_path
    else
      @cars = Car.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "You are registered."
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def update
    if @user.update(user_params)      #mass assignment
      flash[:notice] = "User was updated."
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    #@user = User.find_by slug: params[:id]
    @user = User.find params[:id]
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You are not allowed to do that."
      redirect_to root_path
    end
  end

end
