class SessionsController < ApplicationController
  def new
  end

  def create
    @list = List.new
    @lists = List.all
    if auth
      #log in via OAuth
      # my github email is nil, but I had a nickname
      # facebook has name, not nickname -- in case an email was nil
      oauth_email = auth["info"]["email"] || auth["info"]["nickname"] || auth["info"]["name"]
      #existing user
      if user = User.find_by(:email => oauth_email)
        session[:user_id] = user.id
        @auth = auth
        render '/lists/index'
      else
        #new user
        user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        if user.save
          session[:user_id] = user.id
          @auth = auth
          render '/lists/index'
        else
          redirect_to '/login'
        end
      end

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

    def auth
      request.env['omniauth.auth']
    end

  def destroy
    reset_session
    redirect_to login_path
  end
  helper_method :auth
end
