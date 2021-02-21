class Console < ActiveRecord::Base
    belongs_to :user
    has_many :games_consoles
    has_many :games, through: :games_consoles
end
