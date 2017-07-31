# Preview all emails at http://localhost:3000/rails/mailers/registo_mailer
class RegistoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/registo_mailer/novo_registo
  def novo_registo
    RegistoMailer.novo_registo
  end

end
