class Empresa < ApplicationRecord
  belongs_to :cidade
  has_many :funcionarios
  has_many :Usuarios

  mount_uploader :logotipo, LogotipoEmpresaUploader

  def activar_e_desactivar_empresa
    if (self.is_active)
      self.update_columns(is_active: false)
    else
      self.update_columns(is_active: true)
    end
  end

  def cria_usuario

    usuario = Usuario.new

    usuario.senha_provisoria = rand(2**256).to_s(36).ljust(8, 'a')[0..10]
    usuario.nome = "#{self.nome}"
    usuario.role = 1
    usuario.telemovel = "#{self.telemovel}"
    usuario.email = "#{self.email}"
    usuario.password = usuario.senha_provisoria
    usuario.password_confirmation = usuario.senha_provisoria
    usuario.empresa_id = self.id

    usuario.save

    RegistoMailer.aprovar_registo(usuario).deliver

  end


   validates :nome,
      presence: {message: 'não pode estar em branco'},
      length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

    validates :email,
             presence: {message: 'não pode estar em branco'},
             length: {in: 6..100, message: "o mínimo de caracteres são 6 e o máximo são 100"}

    validates :telemovel, uniqueness: true,
              presence: {message: "não pode estar em branco!"},
              :numericality => {:only_integer => true, message: "numero de telefone inválido"},
              length: {in: 9..9, message: "número de telefone inválido. Ex: 923456699"}

    validates :cidade_id,
             presence: {message: 'não pode estar em branco'}





end
