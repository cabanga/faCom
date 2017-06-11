json.extract! funcionario, :id, :nome, :telemovel, :tipo_de_id, :numero_id, :created_at, :updated_at
json.url funcionario_url(funcionario, format: :json)
