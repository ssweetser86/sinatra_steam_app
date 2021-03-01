class ConsolesController < ApplicationController

  # GET: /consoles
  get "/consoles" do
    redirect_if_not_logged_in
    @user = User.find(session[:user_id])
    erb :"/consoles/index.html"
  end

  # POST: /consoles
  post "/consoles" do
    redirect_if_not_logged_in
    @user = User.find(session[:user_id])
    console = Console.find_or_create_by(name: params[:name])
    @user.consoles << console if !@user.consoles.include?(console)
    redirect "/consoles"
  end

  # GET: /consoles/5
  get "/consoles/:id" do
    redirect_if_not_logged_in
    @console = Console.find(params[:id])
    erb :"/consoles/show.html"
  end

  # GET: /consoles/5/edit
  get "/consoles/:id/edit" do
    redirect_if_not_logged_in
    @console = Console.find(params[:id])
    erb :"/consoles/edit.html"
  end

  # PATCH: /consoles/5
  patch "/consoles/:id" do
    redirect_if_not_logged_in
    @console = Console.find_or_create_by(params[:name])
    @user = current_user
    @user.consoles.delete(Console.find(params[:id]))
    @user.consoles << @console
    redirect_to_home_page
  end


  # DELETE: /consoles/5/delete
  delete "/consoles/:id/delete" do
    redirect_if_not_logged_in
    @user = current_user
    @user.consoles.delete(Console.find(params[:id]))
    redirect_to_home_page
  end
end
