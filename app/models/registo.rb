class Registo < ApplicationRecord
  belongs_to :cidade

  enum role: {nao_aprovado: 0, aprovado: 1}

  def criar_empresa
    empresa = Empresa.create(nome: "#{self.nome_empresa}", telemovel: "#{self.telemovel}", telefone: "", email: "#{self.email}", estado: 1, is_active: true, cidade_id: self.cidade)
    usuario = Usuario.create(nome: "#{self.nome_user}", role: 1, telemovel: "#{self.telemovel}", email: "#{self.email}", password: 'q1w2e3r4t5', password_confirmation: 'q1w2e3r4t5', empresa_id: empresa.id)

    p usuario
  end

  def aprovar
    self.update_columns(estado: 1)
  end

end
