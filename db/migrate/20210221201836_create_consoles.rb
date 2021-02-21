class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|

      t.timestamps null: false
    end
  end
end
