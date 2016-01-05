class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #helper_method makes these methods available to the view
  helper_method  :current_user, :logged_in?, :cars_path?, :users_path?

  def current_user
    #if there is an authenticated user, return user obj, else nil
    # Memoization
    # a ||= b is shorthand a || a = b, e.g., the assignment happens only once
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def cars_path?
    request.original_url.include?("/cars/")
  end

  def users_path?
    request.original_url.include?("/users/")
  end

  def access_denied
    flash[:error] = "You don't have permissions for the requested operation."
    redirect_to root_path
  end


end
