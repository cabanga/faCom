class Funcionario < ApplicationRecord
  belongs_to :empresa
  belongs_to :usuario

  def tornar_usuario
    usuario = Usuario.new

    usuario.senha_provisoria = rand(2**256).to_s(36).ljust(8, 'a')[0..10]
    usuario.nome = self.nome
    usuario.telemovel = self.telemovel
    usuario.empresa_id = self.id
    usuario.role = 1
    # usuario.email = "#{self.email}"
    usuario.password = usuario.senha_provisoria
    usuario.password_confirmation = usuario.senha_provisoria

    usuario.save

    puts "****************************************"*10

    p usuario

    #
    #
    #
    # # unless Rails.env.development? || Rails.env.test?
    # #  RegistoMailer.aprovar_registo(usuario).deliver
    # # end
    #
    # self.update_columns(usuario_id: usuario.id)


  end

end
