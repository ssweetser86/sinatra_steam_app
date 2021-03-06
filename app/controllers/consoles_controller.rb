class ConsolesController < ApplicationController

  get "/consoles" do
    redirect_if_not_logged_in
    @user = User.find(session[:user_id])
    erb :"/consoles/index.html"
  end

  post "/consoles" do
    redirect_if_not_logged_in
    if valid_params?(params)
      user = User.find(session[:user_id])
      console = Console.find_or_create_by(name: params[:name], company: params[:company])
      user.consoles << console if !user.consoles.include?(console)
    end
    redirect "/consoles"
    
  end

  get "/consoles/:id" do
    redirect_if_not_logged_in
    @console = Console.find(params[:id])
    @games = @console.games.sort_by {|g| g.title }
    erb :"/consoles/show.html"
  end

  get "/consoles/:id/edit" do
    redirect_if_not_logged_in
    @console = Console.find(params[:id])
    erb :"/consoles/edit.html"
  end

  patch "/consoles/:id" do
    redirect_if_not_logged_in
    @console = Console.find_or_create_by(name: params[:name])
    @user = current_user
    @user.consoles.delete(Console.find(params[:id]))
    @user.consoles << @console
    redirect_to_home_page
  end

  delete "/consoles/:id/delete" do
    redirect_if_not_logged_in
    @user = current_user
    @user.consoles.delete(Console.find(params[:id]))
    redirect_to_home_page
  end
end
