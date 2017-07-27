class CreateItemFacturas < ActiveRecord::Migration[5.0]
  def change
    create_table :item_facturas do |t|
      t.string :codigo
      t.integer :quantidade
      t.decimal :preco_unitario
      t.string :descricao
      t.decimal :preco_total
      t.references :factura, foreign_key: true

      t.timestamps
    end
  end
end
