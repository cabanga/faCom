class ChangeColumnValorFromTipoDeImposto < ActiveRecord::Migration[5.0]
  def change
    remove_column :tipos_de_impostos, :valor
    add_column :tipos_de_impostos, :is_active, :boolean, null: false, default: false
  end
end
