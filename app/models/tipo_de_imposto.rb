class TipoDeImposto < ApplicationRecord
  belongs_to :empresa


  validates :tipo,
  presence: {message: 'não pode estar em branco'}


  validates :motivo,
  presence: {message: 'não pode estar em branco'}

  validates :percentagem,
  presence: {message: 'não pode estar em branco'}


end
