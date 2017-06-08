class Empresa < ApplicationRecord
  belongs_to :cidade
  mount_uploader :logotipo, LogotipoEmpresaUploader

end
