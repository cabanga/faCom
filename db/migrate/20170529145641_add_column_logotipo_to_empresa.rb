class AddColumnLogotipoToEmpresa < ActiveRecord::Migration[5.0]
  def change
    add_column :empresas, :logotipo, :string
  end
end
