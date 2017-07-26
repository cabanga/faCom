class AprovarRegistoMailer < ApplicationMailer
  default from: "facomtechys@gmail.com"

  def aprovar_registo(usuario)
    @assunto = "Aprovação de Registo"

    @usuario = usuario
    mail(to: @usuario.email, subject: @assunto)
  end

end
