class AddColumnIsPayToFacturas < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas, :is_payd, :boolean, null: false, default: false
  end
end
