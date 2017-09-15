class Funcionario < ApplicationRecord
  belongs_to :empresa
  belongs_to :usuario

  def tornar_usuario
    usuario = Usuario.new

    senha = rand(2**256).to_s(36).ljust(8, 'a')[0..10]

    usuario.nome = self.nome
    usuario.telemovel = self.telemovel
    usuario.empresa_id = self.empresa_id
    usuario.role = 1
    usuario.email = self.email

    usuario.senha_provisoria = senha
    usuario.password = senha
    usuario.password_confirmation = senha

    usuario.save
    self.update_columns(usuario_id: usuario.id)

    UsuarioMailer.novo_usuario(usuario).deliver

  end

end
