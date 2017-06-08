class AddColumnEstadoToRegisto < ActiveRecord::Migration[5.0]
  def change
    add_column :registos, :estado, :integer, null: false, default: 0
  end
end
