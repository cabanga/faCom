class AddColumnSenhaProvisoriaToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :senha_provisoria, :string
  end
end
