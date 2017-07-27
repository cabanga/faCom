json.extract! item_factura, :id, :codigo, :quantidade, :preco_unitario, :descricao, :preco_total, :factura_id, :created_at, :updated_at
json.url item_factura_url(item_factura, format: :json)
