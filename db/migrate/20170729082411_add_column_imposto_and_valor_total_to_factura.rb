class AddColumnImpostoAndValorTotalToFactura < ActiveRecord::Migration[5.0]
  def change
    add_column :facturas, :percentagem_imposto, :integer, null: false, default: 0
    add_column :facturas, :valor_total, :decimal, null: false, default: 0
    add_column :facturas, :desconto, :decimal, null: false, default: 0
  end
end
