class TiposDeDescontosController < ApplicationController
  before_action :set_tipo_de_desconto, only: [:show, :edit, :update, :destroy]
  before_action :set_empresa

  # GET /tipos_de_descontos
  # GET /tipos_de_descontos.json
  def index
    @tipos_de_descontos = TipoDeDesconto.all
  end

  # GET /tipos_de_descontos/1
  # GET /tipos_de_descontos/1.json
  def show
  end

  # GET /tipos_de_descontos/new
  def new
    @tipo_de_imposto = @empresa.tipos_de_descontos.new
  end

  # GET /tipos_de_descontos/1/edit
  def edit
  end

  # POST /tipos_de_descontos
  # POST /tipos_de_descontos.json
  def create

    @empresa = Empresa.find(params[:empresa_id])

    @tipo_de_desconto = TipoDeDesconto.new(tipo_de_desconto_params)
    @tipo_de_desconto.empresa_id = @empresa.id


    respond_to do |format|
      if @tipo_de_desconto.save
        format.html { redirect_to @empresa, notice: 'Tipo de desconto adicionado com sucesso.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @tipo_de_desconto.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /tipos_de_descontos/1
  # PATCH/PUT /tipos_de_descontos/1.json
  def update
    respond_to do |format|
      if @tipo_de_desconto.update(tipo_de_desconto_params)
        format.html { redirect_to @empresa, notice: 'Tipo de desconto actualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @tipo_de_desconto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipos_de_descontos/1
  # DELETE /tipos_de_descontos/1.json
  def destroy
    @tipo_de_desconto.destroy
    respond_to do |format|
      format.html { redirect_to @empresa, notice: 'Tipo de desconto removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  def activar_e_desactivar
    @tipo_de_desconto.activar_e_desactivar_tipo_de_desconto

    if (@tipo_de_imposto.is_active)
      flash[:notice] = 'O tipo de Desconto foi activada'
    else
      flash[:notice] = 'O tipo de Desconto foi desactivada'
    end
    redirect_to @empresa
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_de_desconto
      @tipo_de_desconto = TipoDeDesconto.find(params[:id])
    end

    def set_empresa
      @empresa = Empresa.find(params[:empresa_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_de_desconto_params
      params.require(:tipo_de_desconto).permit(:nome, :natureza, :motivo, :percentagem, :empresa_id, :is_active)
    end
end
