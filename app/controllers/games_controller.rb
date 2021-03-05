class GamesController < ApplicationController

  post "/games" do
    title = params[:title]
    title = params[:title_add] if title == "Create Game"
    @game = Game.find_or_create_by(title: title, console_id: params[:console_id])
    current_user.games << @game if !current_user.games.include?(@game)

    redirect "/consoles/#{params[:console_id]}"
  end

  delete "/games/:id/delete" do
    redirect_if_not_logged_in
    @user = current_user
    @user.games.delete(Game.find(params[:id]))
    redirect "/consoles/#{params[:console_id]}"
  end
end
