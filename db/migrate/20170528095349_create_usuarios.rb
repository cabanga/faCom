class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :telemovel
      t.references :empresa, foreign_key: true

      t.timestamps
    end
  end
end
