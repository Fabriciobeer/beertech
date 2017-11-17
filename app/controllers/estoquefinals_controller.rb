class EstoquefinalsController < ApplicationController
  before_action :set_estoquefinal, only: [:show, :edit, :update, :destroy]

  # GET /estoquefinals
  # GET /estoquefinals.json
  def index
    @estoquefinals = Estoquefinal.all
  end

  # GET /estoquefinals/1
  # GET /estoquefinals/1.json
  def show
  end

  # GET /estoquefinals/new
  def new
    @estoquefinal = Estoquefinal.new
  end

  # GET /estoquefinals/1/edit
  def edit
  end

  # POST /estoquefinals
  # POST /estoquefinals.json
  def create
    @estoquefinal = Estoquefinal.new(estoquefinal_params)

    respond_to do |format|
      if @estoquefinal.save
        format.html { redirect_to @estoquefinal, notice: 'Estoquefinal was successfully created.' }
        format.json { render :show, status: :created, location: @estoquefinal }
      else
        format.html { render :new }
        format.json { render json: @estoquefinal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoquefinals/1
  # PATCH/PUT /estoquefinals/1.json
  def update
    respond_to do |format|
      if @estoquefinal.update(estoquefinal_params)
        format.html { redirect_to @estoquefinal, notice: 'Estoquefinal was successfully updated.' }
        format.json { render :show, status: :ok, location: @estoquefinal }
      else
        format.html { render :edit }
        format.json { render json: @estoquefinal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoquefinals/1
  # DELETE /estoquefinals/1.json
  def destroy
    @estoquefinal.destroy
    respond_to do |format|
      format.html { redirect_to estoquefinals_url, notice: 'Estoquefinal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estoquefinal
      @estoquefinal = Estoquefinal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoquefinal_params
      params.require(:estoquefinal).permit(:id_item, :id_cervejaria, :quantidade_atual, :destino)
    end
end
