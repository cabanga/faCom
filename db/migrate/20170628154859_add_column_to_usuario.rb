class AddColumnToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :provider, :string
    add_column :usuarios, :uid, :string
    add_column :usuarios, :oauth_token, :string
    add_column :usuarios, :oauth_expires_at, :datetime
  end
end
