class Empresa < ApplicationRecord
  belongs_to :cidade
  belongs_to :funcionarios
  mount_uploader :logotipo, LogotipoEmpresaUploader

  def activar_e_desactivar_empresa
    if (self.is_active)
      self.update_columns(is_active: false)
    else
      self.update_columns(is_active: true)
    end
  end

end
