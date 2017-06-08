class CreateRegistos < ActiveRecord::Migration[5.0]
  def change
    create_table :registos do |t|
      t.string :nome_user
      t.string :nome_empresa
      t.string :telemovel
      t.string :email

      t.timestamps
    end
  end
end
