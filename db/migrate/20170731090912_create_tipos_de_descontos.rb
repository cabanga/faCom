class CreateTiposDeDescontos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos_de_descontos do |t|
      t.string :nome
      t.string :natureza
      t.string :motivo
      t.integer :percentagem
      t.boolean :is_active, :boolean, null: false, default: false

      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
