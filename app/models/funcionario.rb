class Funcionario < ApplicationRecord
  has_many :empresa, dependent: :destroy

end
