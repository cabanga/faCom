class RegistosController < ApplicationController
  before_action :set_registo, only: [:show, :edit, :update, :destroy, :aprovar_registo]

  # GET /registos
  # GET /registos.json
  def index
    @registos = Registo.all
  end

  # GET /registos/1
  # GET /registos/1.json
  def show
  end

  # GET /registos/new
  def new
    @registo = Registo.new
  end

  # GET /registos/1/edit
  def edit
  end

  # POST /registos
  # POST /registos.json
  def create
    @registo = Registo.new(registo_params)

    respond_to do |format|
      if @registo.save
        format.html { redirect_to @registo, notice: 'Registo was successfully created.' }
        format.json { render :show, status: :created, location: @registo }
      else
        format.html { render :new }
        format.json { render json: @registo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registos/1
  # PATCH/PUT /registos/1.json
  def update
    respond_to do |format|
      if @registo.update(registo_params)
        format.html { redirect_to @registo, notice: 'Registo was successfully updated.' }
        format.json { render :show, status: :ok, location: @registo }
      else
        format.html { render :edit }
        format.json { render json: @registo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registos/1
  # DELETE /registos/1.json
  def destroy
    @registo.destroy
    respond_to do |format|
      format.html { redirect_to registos_url, notice: 'Registo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def aprovar_registo
    if Usuario.find_by(email: @registo.email) || Usuario.find_by(telemovel: @registo.telemovel)
      flash[:error] = 'email ou telemóvel indisponível'
    else
      @registo.criar_empresa
      @registo.aprovar # Alterar o status para aprovado
    end

    redirect_to registos_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registo
      @registo = Registo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registo_params
      params.require(:registo).permit(:nome_user, :nome_empresa, :telemovel, :email, :cidade, :estado)
    end
end
