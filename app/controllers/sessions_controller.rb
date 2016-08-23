class SessionsController < ApplicationController
  def new
  end

  def create
    @list = List.new
    @lists = List.all
    if auth = request.env["omniauth.auth"]
      #log in via OAuth
      #@user = User.from_omniauth(auth)
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      #Normal login with username and password
      user = User.find_or_create_by(:email => params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
