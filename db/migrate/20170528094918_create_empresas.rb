class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :telemovel
      t.string :telefone
      t.string :email
      t.integer :estado
      t.boolean :is_active
      t.references :cidade, foreign_key: true

      t.timestamps
    end
  end
end
