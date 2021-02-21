class CreateGamesConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :games_consoles do |t|
      t.belongs_to :game
      t.belongs_to :console
    end
  end
end
