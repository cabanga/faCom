class AddColumnIsProformaToFactura < ActiveRecord::Migration[5.0]
  def change
  	add_column :facturas, :is_proforma, :string

  	Factura.all.each do |factura|
  		factura.is_proforma = "Factura Normal"
  		factura.save
  	end
  	
  end
end
