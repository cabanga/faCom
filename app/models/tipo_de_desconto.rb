class TipoDeDesconto < ApplicationRecord
  belongs_to :empresa

  def activar_e_desactivar_tipo_de_desconto
    if (self.is_active)
      self.update_columns(is_active: false)
    else
      self.update_columns(is_active: true)
    end
  end


  validates :nome,
  presence: {message: 'não pode estar em branco'}

  validates :natureza,
  presence: {message: 'não pode estar em branco'}

  validates :motivo,
  presence: {message: 'não pode estar em branco'}

  validates :percentagem,
  presence: {message: 'não pode estar em branco'}



end
