class AddColumnCidadeToRegisto < ActiveRecord::Migration[5.0]
  def change
    add_reference :registos, :cidade, foreign_key: true
  end
end
