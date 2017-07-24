class Registo < ApplicationRecord
  belongs_to :cidade

  enum estado: {em_espera: 0, aprovado: 1}

  def criar_empresa
    empresa = Empresa.create(nome: "#{self.nome_empresa}", telemovel: "#{self.telemovel}", telefone: "", email: "#{self.email}", estado: 1, is_active: true, cidade_id: self.cidade)
    usuario = Usuario.create(nome: "#{self.nome_user}", role: 1, telemovel: "#{self.telemovel}", email: "#{self.email}", password: 'q1w2e3r4t5', password_confirmation: 'q1w2e3r4t5', empresa_id: empresa.id)

    p usuario
  end

  def aprovar
    self.update_columns(estado: 1)
  end

  validates :nome_user,
     presence: {message: 'não pode estar em branco'},
     format: {with: NOME_REGEX, message: "caracteres inválidos. Ex: Hermenegildo ou Beatriz Madalena"},
     length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

   validates :nome_empresa,
      presence: {message: 'não pode estar em branco'},
      length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

    validates :email,
             presence: {message: 'não pode estar em branco'},
             length: {in: 6..100, message: "o mínimo de caracteres são 6 e o máximo são 100"}

    validates :telemovel, uniqueness: true,
              presence: {message: "não pode estar em branco!"},
              :numericality => {:only_integer => true, message: "numero de telefone inválido"},
              length: {in: 9..9, message: "número de telefone inválido. Ex: 923456699"}





end
