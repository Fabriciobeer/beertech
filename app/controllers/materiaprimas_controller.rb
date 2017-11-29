class MateriaprimasController < ApplicationController
  before_action :set_materiaprima, only: [ :edit, :update, :destroy]

  # GET /materiaprimas
  # GET /materiaprimas.json
  def index
    @materiaprimas = Materiaprima.all
  end

  # GET /materiaprimas/1
  # GET /materiaprimas/1.json
  def show
  end

  # GET /materiaprimas/new
  def new
    if logged_in?
      @materiaprima = Materiaprima.new
    else
      redirect_to root_path
    end
    
  end

  # GET /materiaprimas/1/edit
  def edit
  end

  # POST /materiaprimas
  # POST /materiaprimas.json
  def create
    @materiaprima = Materiaprima.new(materiaprima_params)
    @materiaprima.cliente_id = current_user.cliente_id
    respond_to do |format|
      if @materiaprima.save
        format.html { redirect_to new_materiaprima_path, notice: 'Materiaprima was successfully created.' }
        format.json { render :show, status: :created, location: @materiaprima }
      else
        format.html { render :new }
        format.json { render json: @materiaprima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materiaprimas/1
  # PATCH/PUT /materiaprimas/1.json
  def update
    respond_to do |format|
      if @materiaprima.update(materiaprima_params)
        format.html { redirect_to @materiaprima, notice: 'Materiaprima was successfully updated.' }
        format.json { render :show, status: :ok, location: @materiaprima }
      else
        format.html { render :edit }
        format.json { render json: @materiaprima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materiaprimas/1
  # DELETE /materiaprimas/1.json
  def destroy
    @materiaprima.destroy
    respond_to do |format|
      format.html { redirect_to materiaprimas_url, notice: 'Materiaprima was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_materiaprima
      @materiaprima = Materiaprima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def materiaprima_params
      params.require(:materiaprima).permit(:cliente_id, :item, :unidades, :tamanho_pacote)
    end
end