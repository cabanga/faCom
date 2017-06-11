class CreateFuncionarios < ActiveRecord::Migration[5.0]
  def change
    create_table :funcionarios do |t|
      t.string :nome
      t.string :telemovel
      t.string :tipo_de_ident
      t.string :numero_ident
      
      t.timestamps
    end
  end
end
