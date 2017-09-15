class Funcionario < ApplicationRecord
  belongs_to :empresa
  belongs_to :usuario

  def tornar_usuario
    usuario = Usuario.new

    senha = rand(2**256).to_s(36).ljust(8, 'a')[0..10]

    usuario.nome = self.nome
    usuario.telemovel = self.telemovel
    usuario.empresa_id = self.empresa_id
    usuario.role = 2
    usuario.email = self.email

    usuario.senha_provisoria = senha
    usuario.password = senha
    usuario.password_confirmation = senha

    usuario.save
    self.update_columns(usuario_id: usuario.id)

    UsuarioMailer.novo_usuario(usuario).deliver

  end

  validate :validar_email, :validar_telemovel

  private

  validates :nome,
     presence: {message: 'não pode estar em branco'},
     format: {with: NOME_REGEX, message: "caracteres inválidos. Ex: Hermenegildo ou Beatriz Madalena"},
     length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

    validates :telemovel, uniqueness: true,
              presence: {message: "não pode estar em branco!"},
              :numericality => {:only_integer => true, message: "numero de telefone inválido"},
              length: {in: 9..9, message: "número de telefone inválido. Ex: 923456699"}

  def validar_email
    if Usuario.find_by(email: self.email)
      errors.add(:email, 'endereço de email indisponível')
    end
  end

  def validar_telemovel
    if Usuario.find_by(telemovel: self.telemovel)
      errors.add(:telemovel, 'Número de telemóvel indisponível')
    end
  end

end
