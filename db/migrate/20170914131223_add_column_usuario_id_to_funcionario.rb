class AddColumnUsuarioIdToFuncionario < ActiveRecord::Migration[5.0]
  def change
    add_reference :funcionarios, :usuario, foreign_key: true
  end
end
