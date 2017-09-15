class AddIpcFromEmpresasEmProducao < ActiveRecord::Migration[5.0]
  def change
    Empresa.all.each do |empresa|
      empresa.update_columns(ipc: 5)
    end
  end
end
