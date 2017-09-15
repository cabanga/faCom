class UsuarioMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mailer.novo_usuario_mailer.subject
  #


  def novo_usuario(usuario)
    @assunto = "Bem-Vindo à Facom"
    @usuario = usuario
    @empresa = usuario.empresa_id

    mail(to: usuario.email, subject: @assunto)
  end



end
