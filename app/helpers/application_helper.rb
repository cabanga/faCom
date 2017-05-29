module ApplicationHelper
   



  def nome_current_user
    if admin_signed_in?
      (current_admin.nome.blank?)? current_admin.email : current_admin.nome
    elsif usuario_signed_in?
      (current_usuario.nome.blank?)? current_usuario.email : current_usuario.nome
    end
  end

  def current_auth_resource
    if admin_signed_in?
      current_admin
    else
      current_usuario
    end
  end

  def link_destroy_session
    if admin_signed_in?
      destroy_admin_session_path
    elsif usuario_signed_in?
      destroy_usuario_session_path
    end
  end

  Bignum.class_eval do
    # Converte decimals para kwanza
    # deve ser chamado da como método de instância
    def to_kwanza
      self.to_f.to_kwanza
    end

    def to_month
      self.to_i.to_month
    end

    def to_month_abbr
      self.to_i.to_month_abbr
    end
  end

  def user_signed_in?
    admin_signed_in? || usuario_signed_in?
  end


end
