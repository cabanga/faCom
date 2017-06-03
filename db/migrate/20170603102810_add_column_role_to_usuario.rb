class AddColumnRoleToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :role, :integer
  end
end
