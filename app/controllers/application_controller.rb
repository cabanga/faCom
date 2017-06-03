include ApplicationHelper

class ApplicationController < ActionController::Base
  alias_method :current_user, :current_usuario

  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:nome, :email, :telemovel,:password, :roles_mask, :password_confirmation) }
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :email, :telemovel, :password, :password_confirmation, :current_password, :remember_me) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:nome, :email, :telemovel, :password, :password_confirmation, :roles_mask, :current_password) }
  end


end
