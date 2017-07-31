class TiposDeImpostosController < ApplicationController
  before_action :set_tipo_de_imposto, only: [:show, :edit, :update, :destroy, :activar_e_desactivar]
  before_action :set_empresa

  # GET /tipos_de_impostos
  # GET /tipos_de_impostos.json
  def index
    @tipos_de_impostos = TipoDeImposto.all
  end

  # GET /tipos_de_impostos/1
  # GET /tipos_de_impostos/1.json
  def show
  end

  # GET /tipos_de_impostos/new
  def new
    @tipo_de_imposto = @empresa.tipos_de_impostos.new
  end

  # GET /tipos_de_impostos/1/edit
  def edit
  end

  # POST /tipos_de_impostos
  # POST /tipos_de_impostos.json
  def create
    @empresa = Empresa.find(params[:empresa_id])

    @tipo_de_imposto = TipoDeImposto.new(tipo_de_imposto_params)
    @tipo_de_imposto.empresa_id = @empresa.id

    respond_to do |format|
      if @tipo_de_imposto.save
        format.html { redirect_to @empresa, notice: 'Tipo de imposto adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo_de_imposto }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_imposto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipos_de_impostos/1
  # PATCH/PUT /tipos_de_impostos/1.json
  def update
    respond_to do |format|
      if @tipo_de_imposto.update(tipo_de_imposto_params)
        format.html { redirect_to @empresa, notice: 'Tipo de imposto actualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo_de_imposto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_imposto.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_e_desactivar
    @tipo_de_imposto.activar_e_desactivar_tipo_de_imposto

    if (@tipo_de_imposto.is_active)
      flash[:notice] = 'O tipo de Imposto foi activada'
    else
      flash[:notice] = 'O tipo de Imposto foi desactivada'
    end
    redirect_to @empresa
  end

  # DELETE /tipos_de_impostos/1
  # DELETE /tipos_de_impostos/1.json
  def destroy
    @tipo_de_imposto.destroy
    respond_to do |format|
      format.html { redirect_to @empresa, notice: 'Tipo de imposto removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_imposto
      @tipo_de_imposto = TipoDeImposto.find(params[:id])
    end

    def set_empresa
      @empresa = Empresa.find(params[:empresa_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_imposto_params
      params.require(:tipo_de_imposto).permit(:tipo, :motivo, :percentagem, :is_active, :empresa_id)
    end
end
