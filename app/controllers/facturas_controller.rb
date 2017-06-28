class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy, :pagar_factura]

  # GET /facturas
  # GET /facturas.json
  def index
    if (current_usuario.super_admin?)
      @facturas = Factura.all
    else
      @facturas = Factura.where(empresa_id: current_usuario.empresa.id)
    end
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
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

    unless current_usuario.super_admin?
      @factura.empresa_id = current_usuario.empresa.id
      @factura.responsavel = current_usuario.nome
    end

    @factura.referencia = @factura.gera_referencia

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'Factura was successfully created.' }
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
        format.html { redirect_to @factura, notice: 'Factura was successfully updated.' }
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
      params.require(:factura).permit(:referencia, :cliente, :contacto, :tipo_de_servico, :responsavel, :empresa_id)
    end
end
