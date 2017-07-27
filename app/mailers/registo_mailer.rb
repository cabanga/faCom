class RegistoMailer < ApplicationMailer

  def aprovar_registo(usuario)
    @assunto = "Registo Aprovado"

    @usuario = usuario
    mail(to: @usuario.email, subject: @assunto)
  end

  def novo_registo(registo)
    @assunto = "Registo Enviado"

    @registo = registo

    mail(to: @registo.email, subject: @assunto)

  end
end
