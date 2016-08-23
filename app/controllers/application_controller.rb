class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    #only call db once instead of each time
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  # methods built in controllers do not go to ActionView part of code
  helper_method :current_user
  # you can call this if you use this ^^
end

# loads all helper methods
