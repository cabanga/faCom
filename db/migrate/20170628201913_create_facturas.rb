class CreateFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :facturas do |t|
      t.string :referencia
      t.string :cliente
      t.string :contacto
      t.string :tipo_de_servico
      t.string :responsavel
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
