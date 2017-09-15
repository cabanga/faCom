class AddIpcFromEmpresasEmProducao < ActiveRecord::Migration[5.0]
  def change
    Empresa.all.each do |empresa|
      empresa.ipc = 5
      empresa.save
    end
  end
end
