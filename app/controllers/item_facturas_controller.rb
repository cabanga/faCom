class ItemFacturasController < ApplicationController
  before_action :set_item_factura, only: [:show, :edit, :update, :destroy]
  before_action :set_factura

  # GET /item_facturas
  # GET /item_facturas.json
  def index
    @item_facturas = ItemFactura.all
  end

  # GET /item_facturas/1
  # GET /item_facturas/1.json
  def show
  end

  # GET /item_facturas/new
  def new
    @item_factura = @factura.item_facturas.new

    # @item_factura = ItemFactura.new
  end

  # GET /item_facturas/1/edit
  def edit
  end

  # POST /item_facturas
  # POST /item_facturas.json
  def create
    @factura = Factura.find(params[:factura_id])

    # @item_factura = @factura.item_facturas.new(item_factura_params)
    p item_factura_params
    @item_factura = ItemFactura.new(item_factura_params)
    @item_factura.factura_id = @factura.id

    respond_to do |format|
      if @item_factura.save

        @item_factura.preco_total = @item_factura.quantidade * @item_factura.preco_unitario
        @item_factura.save

        #send mailer

        
        format.html { redirect_to @factura, notice: "Item adicionado na factura Nº #{@factura.referencia} com sucesso." }
        format.json { render :show, status: :created, location: @item_factura }
      else
        format.html { render :new }
        format.json { render json: @item_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_facturas/1
  # PATCH/PUT /item_facturas/1.json
  def update
    respond_to do |format|
      if @item_factura.update(item_factura_params)
        format.html { redirect_to @factura, notice: 'Item factura was successfully updated.' }
        format.json { render :show, status: :ok, location: @item_factura }
      else
        format.html { render :edit }
        format.json { render json: @item_factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_facturas/1
  # DELETE /item_facturas/1.json
  def destroy
    @item_factura.destroy
    respond_to do |format|
      format.html { redirect_to @factura, notice: 'Item Removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_factura
      @item_factura = ItemFactura.find(params[:id])
    end

    def set_factura
      @factura = Factura.find(params[:factura_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_factura_params
      params.require(:item_factura).permit(:codigo, :quantidade, :preco_unitario, :descricao, :preco_total, :factura_id)
    end
end
