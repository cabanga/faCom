class AddColumnUsuarioIdToFuncionario < ActiveRecord::Migration[5.0]
  def change
    add_reference :funcionarios, :usuario, foreign_key: true
    add_column :funcionarios,    :email,   :string,  null: false, default: ""
    add_column :empresas,        :ipc,     :integer, null: false, default: 5


  end
end
