class CiclovidasController < ApplicationController
  before_action :set_ciclovida, only: [:show, :edit, :update, :destroy]

  # GET /ciclovidas
  # GET /ciclovidas.json
  def index 
    if logged_in? && current_user.cliente.ciclo_vida_barril == "Sim"
      @ciclovidas = Ciclovida.where(cliente_id: current_user.cliente_id)
    else
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
      redirect_to root_path
    end
  end

  # GET /ciclovidas/1
  # GET /ciclovidas/1.json
  def show
      if logged_in? && current_user.cliente.ciclo_vida_barril == "Sim"
        if Ciclovida.where(cliente_id: current_user.cliente_id).empty?
          redirect_to new_ciclovida_path
          flash[:danger] = "Você não possui barris com a situação atualizada ainda. Por favor atualize a situação dos seus barris primeiro."
        end
        @ciclovida = Ciclovida.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:item_id)
        @ciclovidatempo = Ciclovida.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:item_id)
      else
        redirect_to root_path
        flash[:danger] = "Você não está logado ou não possui permissão para isso."
      end
  end
  
  def analise3
    if logged_in? && current_user.cliente.ciclo_vida_barril == "Sim"
      @ciclovida_itens = Ciclovida.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:item_id)
      @ciclovida = Ciclovida.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /ciclovidas/new
  def new
    if logged_in? && current_user.cliente.ciclo_vida_barril == "Sim"
      @ciclovida = Ciclovida.new
      @item = Item.where(cliente_id: current_user.cliente_id)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
    
  end
  
  def set_item_data
    @itemdata = Item.where(cliente_id: current_user.cliente_id, barcode: params[:barcode]).take
    if Ciclovida.where(cliente_id: current_user.cliente_id, item_id: @itemdata.id).order(updated_at: :desc).first != nil
      @local = Ciclovida.where(cliente_id: current_user.cliente_id, item_id: @itemdata.id).order(updated_at: :desc).first
    end
    
    if @itemdata != nil && @local != nil
      array = [@itemdata.id, @itemdata.item_name, @local.localizacao]
      respond_to do |format|
        format.html
        format.json {render json: array }
      end
    else
      array = [@itemdata.id, @itemdata.item_name, nil]
      respond_to do |format|
        format.html
        format.json {render json: array }
      end
    end
    
  end
  

  # GET /ciclovidas/1/edit
  def edit
    redirect_to root_path
  end

  # POST /ciclovidas
  # POST /ciclovidas.json
  def create
    
    @ciclovida = Ciclovida.new(ciclovida_params)
    @ciclovida.cliente_id = current_user.cliente_id
    
    
    if ciclovida_params[:localizacao] == "não cadastrado ainda"
      @ciclovida.localizacao = "Estoque final. Sujo e vazio"
    end
    if ciclovida_params[:localizacao] == "Estoque final. Sujo e vazio"
      @ciclovida.localizacao = "Estoque de barris. Limpo e vazio"
    end
    if ciclovida_params[:localizacao] == "Estoque de barris. Limpo e vazio"
      @ciclovida.localizacao = "Câmara fria. Cheio"
    end
    if ciclovida_params[:localizacao] == "Câmara fria. Cheio"
      @ciclovida.localizacao = Estoquefinal.where(cliente_id: current_user.cliente_id, item_id: ciclovida_params[:item_id]).order(updated_at: :desc).last.destino
    end
   
    
    respond_to do |format|
      if @ciclovida.save
        format.html { redirect_to new_ciclovida_path, flash: { success: 'Estado do barril atualizado com sucesso' } }
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
      if !Ciclovida.where(cliente_id: current_user.cliente_id).exists?
        redirect_to root_path
        flash[:danger] = "Voce não possui itens cadastrados ainda!"
      else
        @ciclovida = Ciclovida.find(params[:id])
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciclovida_params
      params.require(:ciclovida).permit(:cliente_id, :item_id, :tipo_cerveja, :localizacao)
    end
    
    def outro_param
      params.require(:ciclovida).permit(:barcode)
    end
end
