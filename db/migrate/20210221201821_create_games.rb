class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :console_id
      t.timestamps null: false
    end
  end
end
