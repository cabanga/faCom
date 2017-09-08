class HomeController < ApplicationController
  #load_and_authorize_resource
  alias_method :current_user, :current_usuario

  def index
    redirect_to new_usuario_session_url unless usuario_signed_in?

    if usuario_signed_in?
      @quantidade_de_facturas_de_hoje =  Factura.where(empresa_id: current_usuario.empresa_id)
      @quantidade_de_funcionarios =  Funcionario.where(empresa_id: current_usuario.empresa_id)
    end

  end



end
