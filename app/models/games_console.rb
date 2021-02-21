class GamesConsole < ActiveRecord::Base
    belongs_to :game
    belongs_to :console
end
