json.extract! registo, :id, :nome_user, :nome_empresa, :telemovel, :email, :created_at, :updated_at
json.url registo_url(registo, format: :json)
