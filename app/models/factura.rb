class Factura < ApplicationRecord
  belongs_to :empresa
  has_many :item_facturas, dependent: :destroy

  accepts_nested_attributes_for :item_facturas, allow_destroy: true

  def pagar_factura
    if (self.is_payd)
      self.update_columns(is_payd: false)
    else
      self.update_columns(is_payd: true)
    end
  end

  def gera_referencia
    letra_da_factura = "F"
    ultimo_pagamento = Factura.where(empresa_id: self.empresa.id).last

    if (ultimo_pagamento.nil?)
      return "#{letra_da_factura}000001/#{Time.now.year}"
    else
      ref = ultimo_pagamento.referencia

      n = ref.to_s.split('')
      n.pop
      n.pop
      n.pop
      n.pop
      n.pop
      n.shift
      n = n.join('').to_i
      n += 1
      return "#{letra_da_factura}#{n.to_s.rjust(6, '0')}/#{Time.now.year}"
    end
  end

  validates :cliente,
     presence: {message: 'não pode estar em branco'},
     format: {with: NOME_REGEX, message: "caracteres inválidos. Ex: Hermenegildo ou Beatriz Madalena"},
     length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

   validates :tipo_de_servico,
      presence: {message: 'não pode estar em branco'}



end
