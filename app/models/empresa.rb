class Empresa < ApplicationRecord
  belongs_to :cidade
  has_many :funcionarios

  mount_uploader :logotipo, LogotipoEmpresaUploader

  def activar_e_desactivar_empresa
    if (self.is_active)
      self.update_columns(is_active: false)
    else
      self.update_columns(is_active: true)
    end
  end


  # validates :nome_user,
  #    presence: {message: 'não pode estar em branco'},
  #    format: {with: NOME_REGEX, message: "caracteres inválidos. Ex: Hermenegildo ou Beatriz Madalena"},
  #    length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}
  #
  #  validates :nome_empresa,
  #     presence: {message: 'não pode estar em branco'},
  #     length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}
  #
  #   validates :email,
  #            presence: {message: 'não pode estar em branco'},
  #            length: {in: 6..100, message: "o mínimo de caracteres são 6 e o máximo são 100"}
  #
  #   validates :telemovel, uniqueness: true,
  #             presence: {message: "não pode estar em branco!"},
  #             :numericality => {:only_integer => true, message: "numero de telefone inválido"},
  #             length: {in: 9..9, message: "número de telefone inválido. Ex: 923456699"}





end
