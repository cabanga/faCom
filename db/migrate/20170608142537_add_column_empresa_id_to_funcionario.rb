class AddColumnEmpresaIdToFuncionario < ActiveRecord::Migration[5.0]
  def change
    add_reference :funcionarios, :empresa, foreign_key: true
  end
end
