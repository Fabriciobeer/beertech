class EstoquempsController < ApplicationController
  before_action :set_estoquemp, only: [:show, :edit, :update, :destroy]

  # GET /estoquemps
  # GET /estoquemps.json
  def index
    @estoquemps = Estoquemp.all
  end

  # GET /estoquemps/1
  # GET /estoquemps/1.json
  def show
  end

  # GET /estoquemps/new
  def new
    @estoquemp = Estoquemp.new
  end

  # GET /estoquemps/1/edit
  def edit
  end

  # POST /estoquemps
  # POST /estoquemps.json
  def create
    @estoquemp = Estoquemp.new(estoquemp_params)

    respond_to do |format|
      if @estoquemp.save
        format.html { redirect_to @estoquemp, notice: 'Estoquemp was successfully created.' }
        format.json { render :show, status: :created, location: @estoquemp }
      else
        format.html { render :new }
        format.json { render json: @estoquemp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoquemps/1
  # PATCH/PUT /estoquemps/1.json
  def update
    respond_to do |format|
      if @estoquemp.update(estoquemp_params)
        format.html { redirect_to @estoquemp, notice: 'Estoquemp was successfully updated.' }
        format.json { render :show, status: :ok, location: @estoquemp }
      else
        format.html { render :edit }
        format.json { render json: @estoquemp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoquemps/1
  # DELETE /estoquemps/1.json
  def destroy
    @estoquemp.destroy
    respond_to do |format|
      format.html { redirect_to estoquemps_url, notice: 'Estoquemp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoquemp
      @estoquemp = Estoquemp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoquemp_params
      params.require(:estoquemp).permit(:id_cervejaria, :item, :quantidade_atual, :destino)
    end
end
