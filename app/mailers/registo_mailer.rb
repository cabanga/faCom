class RegistoMailer < ApplicationMailer

  def aprovar_registo(usuario)
    @assunto = "Registo Aprovado"
    @usuario = usuario
    @empresa = usuario.empresa_id

    mail(to: usuario.email, subject: @assunto)
  end

  def novo_registo(registo)
    @assunto = "Registo Enviado"
    @registo = registo
    mail(to: registo.email, subject: @assunto)
  end

  def novo_registo_para_equipa(registo)
    @assunto = "Novo Registo"
    @registo = registo
    mail(from: registo.email, to: "facomtechys@gmail.com", subject: @assunto)
  end



end
