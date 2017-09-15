class EmpresasController < ApplicationController

  before_action :set_empresa, only: [:show, :edit, :update, :destroy, :activar_e_desactivar]

  def index
    redirect_to new_usuario_session_url unless usuario_signed_in?
    if (current_usuario.super_admin?)
      @empresas = Empresa.all
    else
      @empresa = Empresa.find_by(id: current_usuario.empresa.id)
      redirect_to @empresa
    end
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
    @tipos_de_impostos = @empresa.tipos_de_impostos.order('id DESC')
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save

        @empresa.cria_usuario
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @empresa }
      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  def activar_e_desactivar
    @empresa.activar_e_desactivar_empresa

    if (@empresa.is_active)
      flash[:notice] = 'A empresa foi activada'
    else
      flash[:notice] = 'A empresa foi desactivada'
    end

    redirect_to @empresa
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @usuarios = Usuario.where(empresa_id: @empresa.id)
    @usuarios.destroy_all unless @usuarios.blank?

    @facturas = Factura.where(empresa_id: @empresa.id)
    @facturas.destroy_all unless @facturas.blank?

    @funcionarios = Funcionario.where(empresa_id: @empresa.id)
    @funcionarios.destroy_all unless @funcionarios.blank?

    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa e seus associados removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:nome, :telemovel, :telefone, :email, :estado, :is_active, :cidade_id, :logotipo, :ipc)
    end
end
