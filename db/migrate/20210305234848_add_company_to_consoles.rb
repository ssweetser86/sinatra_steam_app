class AddCompanyToConsoles < ActiveRecord::Migration[5.2]
  def change
    add_column :consoles, :company, :string
  end
end
