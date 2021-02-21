class Game < ActiveRecord::Base
    belongs_to :user
    has_many :games_consoles
    has_many :consoles, through: :games_consoles
end
