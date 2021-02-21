class CreateGamesConsoles < ActiveRecord::Migration[5.2]
  def change
    create_table :games_consoles do |t|
      t.integer :game_id
      t.integer :console_id
  end
end
