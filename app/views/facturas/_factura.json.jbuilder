json.extract! factura, :id, :referencia, :cliente, :contacto, :tipo_de_servico, :responsavel, :empresa_id, :created_at, :updated_at
json.url factura_url(factura, format: :json)
