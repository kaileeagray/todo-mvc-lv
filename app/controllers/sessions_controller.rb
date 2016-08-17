class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_or_create_by(:email => params[:email])
    session[:id] = user.id

    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
