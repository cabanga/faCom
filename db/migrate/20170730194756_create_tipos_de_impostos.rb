class CreateTiposDeImpostos < ActiveRecord::Migration[5.0]
  def change
    create_table :tipos_de_impostos do |t|
      t.string :tipo
      t.string :motivo
      t.integer :percentagem
      t.decimal :valor
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
