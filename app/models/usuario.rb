class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :empresa


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]


  enum role: {super_admin: 0, admin: 1}

  def login=(login)
    @login = login
  end

  def login
    @login || self.telemovel || self.email
  end

  # reescrita do metodo de login
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(telemovel) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:telemovel) || conditions.has_key?(:email)
      where(conditions.to_hash).first
    end
  end

  def cria_empresa
    empresa = Empresa.create(nome: "#{self.nome}", telemovel: "#{self.telemovel}", telefone: nil, email: "#{self.email}", estado: 1, is_active: true)
    self.update_columns(empresa_id: empresa.id)
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

end
