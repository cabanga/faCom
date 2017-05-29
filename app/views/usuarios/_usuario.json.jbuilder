json.extract! usuario, :id, :nome, :telemovel, :empresa_id, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
