class Empresa < ApplicationRecord
  belongs_to :cidade
  belongs_to :funcionarios
  mount_uploader :logotipo, LogotipoEmpresaUploader

end
