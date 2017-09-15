class HomeController < ApplicationController
  #load_and_authorize_resource
  alias_method :current_user, :current_usuario

  def index
    redirect_to portal_index_url unless usuario_signed_in?

    if usuario_signed_in?
      if (current_usuario.super_admin?)
        @quantidade_de_facturas_de_hoje =  Factura.where(empresa_id: current_usuario.empresa_id)
        @quantidade_de_funcionarios =  Funcionario.where(empresa_id: current_usuario.empresa_id)
      elsif (current_usuario.admin?)
        @quantidade_de_facturas_de_hoje =  Factura.where(empresa_id: current_usuario.empresa_id)
        @quantidade_de_funcionarios     =  Funcionario.where(empresa_id: current_usuario.empresa_id)
        @quantidade_de_facturas_do_mes  =  Factura.where(empresa_id: current_usuario.empresa_id).where('extract(month from updated_at) = ?', Time.now.month)

      elsif (current_usuario.funcionario_user?)
        @minhas_facturas_de_hoje =  Factura.where(empresa_id: current_usuario.empresa_id).where(responsavel: current_usuario.nome)
        @meu_valor_total_de_hoje =  Factura.valor_mensal_das_facturas_do_funcionario(current_usuario)
        @minhas_facturas_do_mes  =  Factura.where(empresa_id: current_usuario.empresa_id).where(responsavel: current_usuario.nome).where('extract(month from updated_at) = ?', Time.now.month)

      end





    end

  end



end
