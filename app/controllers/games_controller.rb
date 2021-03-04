class GamesController < ApplicationController

  # GET: /games
  get "/games" do
    erb :"/games/index.html"
  end

  # GET: /games/new
  get "/games/new" do
    erb :"/games/new.html"
  end

  # POST: /games
  post "/games" do
    title = params[:title]
    title = params[:title_add] if title == "Create Game"
    @game = Game.find_or_create_by(title: title, console_id: params[:console_id])
    current_user.games << @game if !current_user.games.include?(@game)

    redirect "/consoles/#{params[:console_id]}"
  end

  # GET: /games/5
  get "/games/:id" do
    erb :"/games/show.html"
  end

  # GET: /games/5/edit
  get "/games/:id/edit" do
    erb :"/games/edit.html"
  end

  # PATCH: /games/5
  patch "/games/:id" do
    redirect "/games/:id"
  end

  # DELETE: /games/5/delete
  delete "/games/:id/delete" do
    redirect_if_not_logged_in
    @user = current_user
    @user.games.delete(Game.find(params[:id]))
    redirect "/consoles/#{params[:console_id]}"
  end
end
