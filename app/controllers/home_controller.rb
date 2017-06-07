class HomeController < ApplicationController
  #load_and_authorize_resource
  alias_method :current_user, :current_usuario

  def index
    redirect_to new_usuario_session_url unless usuario_signed_in?
  end



end
