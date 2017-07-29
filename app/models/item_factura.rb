class ItemFactura < ApplicationRecord
  belongs_to :factura

  validates :descricao,
     presence: {message: 'A desscrição não pode estar em branco'},
     length: {in: 6..35, message: "No maximo tem que ter 35 letras"}

end
