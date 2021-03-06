class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy, :pagar_factura]

  # GET /facturas
  # GET /facturas.json
  def index

    if (current_usuario.super_admin?)
      @facturas = Factura.all
    elsif (current_usuario.admin?)
      @facturas = Factura.where(empresa_id: current_usuario.empresa.id)
    elsif (current_usuario.funcionario_user?)
      @facturas = Factura.where(empresa_id: current_usuario.empresa.id).where(responsavel: current_usuario.nome)
    end
  end


  # GET /facturas/1
  # GET /facturas/1.json
  def show
    @item_facturas = @factura.item_facturas.order('id DESC')

    respond_to do |format|
      format.html
      format.pdf do
        pdf = DetalheDaFactura.new(@factura, view_context)
          send_data pdf.render, filename: "factura_#{@factura.referencia}.pdf",
          type: "application/pdf", disposition: "inline"
      end
    end

  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end

  # GET /facturas/1/edit
  def edit
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)

    @factura.empresa_id = current_usuario.empresa.id
    @factura.responsavel = current_usuario.nome

    @factura.percentagem_imposto = current_usuario.empresa.ipc
    @factura.referencia = @factura.gera_referencia

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'Factura adicionada com sucesso.' }
        format.json { render :show, status: :created, location: @factura }
      else
        format.html { render :new }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update

    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'Factura actualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @factura }
      else
        format.html { render :edit }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  def pagar_factura
    @factura.pagar_factura

    if (@factura.is_payd)
      flash[:notice] = 'A factura foi paga com sucesso'
    else
      flash[:notice] = 'A factura foi cancelada'
    end

    redirect_to @factura
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @item_facturas = @factura.item_facturas
    @item_facturas.destroy_all unless @item_facturas.blank?
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url, notice: 'Factura was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:referencia, :cliente, :contacto, :tipo_de_servico, :responsavel, :empresa_id, :is_payd, :percentagem_imposto, :valor_total, :desconto,
                                      :is_proforma, item_facturas_attributes: [:id, :codigo, :quantidade, :preco_unitario, :descricao, :preco_total, :_destroy ])
    end
end
