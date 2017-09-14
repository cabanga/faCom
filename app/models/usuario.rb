class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  belongs_to :empresa, dependent: :destroy
  has_many :funcionarios, dependent: :destroy


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
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nome = auth.info.name
      user.email = auth.info.email
      user.telemovel = auth.extra.raw_info.phone
      user.password = "q1w2e3r4t5"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!

      puts "="*50
      p "outro usuario criado"
      p user

    end
  end

  validates :nome,
     presence: {message: 'não pode estar em branco'},
     format: {with: NOME_REGEX, message: "caracteres inválidos. Ex: Hermenegildo ou Beatriz Madalena"},
     length: {in: 6..50, message: "nome muito curto, Ex: José Pedro ou Adalberto Francisco"}

    validates :telemovel, uniqueness: true,
              presence: {message: "não pode estar em branco!"},
              :numericality => {:only_integer => true, message: "numero de telefone inválido"},
              length: {in: 9..9, message: "número de telefone inválido. Ex: 923456699"}



end
