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
    if logged_in?
      if Estoquefinal.where(cliente_id: current_user.cliente_id).empty?
        redirect_to new_estoquefinal_path
        flash[:danger] = "Você não possui itens em estoque ainda para mostrar. Por favor atualize seu estoque final primeiro."
      end
      @estoquefinal = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:Item_id)
      @estoquefinalitens = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
      @estoquefinalentrada = Estoquefinal.where(cliente_id: current_user.cliente_id, atualizar: "Entrada").order(updated_at: :desc)
      @estoquefinalsaida = Estoquefinal.where(cliente_id: current_user.cliente_id, atualizar: "Saída").order(updated_at: :desc)
    else
      redirect_to root_path
    end
  end
  
  def analise2
    if logged_in?
      @estoquefinal_itens = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:Item_id)
      @estoquefinal = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
    else
      redirect_to root_path
    end
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
    @estoquefinal.cliente_id = current_user.cliente_id

    
    if !Estoquefinal.where(cliente_id: current_user.cliente_id, item: @estoquefinal.item).empty? && @estoquefinal.atualizar == "Entrada"
      
      quantidade_velha = Estoquefinal.where(cliente_id: current_user.cliente_id, item: @estoquefinal.item).last.quantidade_atual
      quantidade_nova = @estoquefinal.quantidade_atual
      @estoquefinal.quantidade_entrada = quantidade_nova
      @estoquefinal.quantidade_atual = quantidade_nova + quantidade_velha
    end
  
  
    if !Estoquefinal.where(cliente_id: current_user.cliente_id, item: @estoquefinal.item).empty? && @estoquefinal.atualizar == "Saída"
      quantidade_velha = Estoquefinal.where(cliente_id: current_user.cliente_id, item: @estoquefinal.item).last.quantidade_atual
      quantidade_nova = @estoquefinal.quantidade_atual
      @estoquefinal.quantidade_saida = quantidade_nova
      @estoquefinal.quantidade_atual = quantidade_velha - quantidade_nova
    end
    
    respond_to do |format|
      if @estoquefinal.save
        format.html { redirect_to new_estoquefinal_path, notice: 'Estoque final foi atualizado com sucesso' }
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
      if !Estoquefinal.where(cliente_id: current_user.cliente_id).exists?
        redirect_to root_path
        flash[:danger] = "Voce não possui itens cadastrados no estoque final ainda!"
      else
        @estoquefinal = Estoquefinal.find(params[:id])
      end
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoquefinal_params
      params.require(:estoquefinal).permit(:item_id, :cliente_id, :quantidade_atual, :destino, :atualizar)
    end
    
    def outro_param
      params.require(:estoquefinal).permit(:item)
    end
end
