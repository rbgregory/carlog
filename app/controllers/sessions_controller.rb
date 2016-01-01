class SessionsController < ApplicationController
  def new

  end

  def create
    # 1. get the user obj
    # 2. see if password matches
    # 3. if so, log in
    # 4. if not, error message

    #local variable, because login is not going to generate errors
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      flash[:notice] = "You've logged in."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There's something wrong with your username or password."
      session[:user_id] = nil
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out."
    redirect_to root_path
  end
end
