class AprovarRegistoMailer < ApplicationMailer
  default from: "facomtechys@gmail.com"



  def aprovar_registo(user)
    @user = user
    mail(to: @user.email, subject: 'Registo Aprovado')
  end

end
