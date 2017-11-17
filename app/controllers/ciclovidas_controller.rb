class CiclovidasController < ApplicationController
  before_action :set_ciclovida, only: [:show, :edit, :update, :destroy]

  # GET /ciclovidas
  # GET /ciclovidas.json
  def index
    @ciclovidas = Ciclovida.all
  end

  # GET /ciclovidas/1
  # GET /ciclovidas/1.json
  def show
  end

  # GET /ciclovidas/new
  def new
    @ciclovida = Ciclovida.new
  end

  # GET /ciclovidas/1/edit
  def edit
  end

  # POST /ciclovidas
  # POST /ciclovidas.json
  def create
    @ciclovida = Ciclovida.new(ciclovida_params)

    respond_to do |format|
      if @ciclovida.save
        format.html { redirect_to @ciclovida, notice: 'Ciclovida was successfully created.' }
        format.json { render :show, status: :created, location: @ciclovida }
      else
        format.html { render :new }
        format.json { render json: @ciclovida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ciclovidas/1
  # PATCH/PUT /ciclovidas/1.json
  def update
    respond_to do |format|
      if @ciclovida.update(ciclovida_params)
        format.html { redirect_to @ciclovida, notice: 'Ciclovida was successfully updated.' }
        format.json { render :show, status: :ok, location: @ciclovida }
      else
        format.html { render :edit }
        format.json { render json: @ciclovida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciclovidas/1
  # DELETE /ciclovidas/1.json
  def destroy
    @ciclovida.destroy
    respond_to do |format|
      format.html { redirect_to ciclovidas_url, notice: 'Ciclovida was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciclovida
      @ciclovida = Ciclovida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciclovida_params
      params.require(:ciclovida).permit(:id_cervejaria, :id_item, :localizacao)
    end
end
