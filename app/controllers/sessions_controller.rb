class SessionsController < ApplicationController
  def create
    user = Usuario.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
    puts "="*50
    p "chegou aqui criou"
    p user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
