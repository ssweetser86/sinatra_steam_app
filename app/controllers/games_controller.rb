class GamesController < ApplicationController

  post "/games" do
    if params[:title] == "Create Game"
      if valid_params?(params)
        game = Game.create(title: params[:title_add], genre: params[:genre])
        current_user.games << game  if !current_user.games.include?(game)
      end
    else
      game = Game.find_by(title: params[:title])
      current_user.games << game
    end
    redirect "/consoles/#{params[:console_id]}"
  end

  delete "/games/:id/delete" do
    redirect_if_not_logged_in
    @user = current_user
    @user.games.delete(Game.find(params[:id]))
    redirect "/consoles/#{params[:console_id]}"
  end
end
