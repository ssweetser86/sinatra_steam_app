require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if !logged_in?
      erb :index
    else
      redirect_to_home_page
    end
  end

  get "/logout" do
    redirect_if_not_logged_in
    session.clear
    redirect_to_home_page
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    if !valid_params?(params)
      redirect '/signup'
    elsif User.find_by(username: params[:username])
      redirect '/signup'
    else
      User.create(username: params[:username], password: params[:password], email: params[:email])
      redirect '/'
    end
  end

  post "/login" do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to_home_page
    else
      redirect to '/'
    end
  end


  helpers do

    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/"
      end
    end

    def redirect_to_home_page
      redirect to "/consoles"
    end

    def valid_params?(hash)
      hash.each do |k, v|
        if v.empty?
          return false
        end
      end
      return true
    end

  end
end
