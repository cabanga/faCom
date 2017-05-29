class HomeController < ApplicationController
  #load_and_authorize_resource
  before_action :verificar_current_login

  def index
    if verificar_current_login
      case verificar_current_login.model_name.to_s
      when 'Admin'

      when 'Usuario'
        redirect_to usuario_sign_in unless user_signed_in?
      end
    end
  end


end
