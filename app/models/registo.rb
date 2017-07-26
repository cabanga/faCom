class Registo < ApplicationRecord
  belongs_to :cidade

  enum estado: {em_espera: 0, aprovado: 1}

  def criar_empresa
    empresa = Empresa.create(nome: "#{self.nome_empresa}", telemovel: "#{self.telemovel}", telefone: "", email: "#{self.email}", estado: 1, is_active: true, cidade_id: self.cidade)

    usuario = Usuario.new

    usuario.senha_provisoria = rand(2**256).to_s(36).ljust(8, 'a')[0..10]
    usuario.nome = "#{self.nome_user}"
    usuario.role = 1
    usuario.telemovel = "#{self.telemovel}"
    usuario.email = "#{self.email}"
    usuario.password = usuario.senha_provisoria
    usuario.password_confirmation = usuario.senha_provisoria
    usuario.empresa_id = empresa.id

    usuario.save

    AprovarRegistoMailer.aprovar_registo(usuario)

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
