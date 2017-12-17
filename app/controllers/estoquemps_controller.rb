class EstoquempsController < ApplicationController
  before_action :set_estoquemp, only: [:show, :destroy]

  before_action :current_user
  
  
  # GET /estoquemps
  # GET /estoquemps.json
  def index
    if logged_in?  && current_user.cliente.estoque_mp == "Sim"
      @estoquemps = Estoquemp.where(cliente_id: current_user.cliente_id)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /estoquemps/1
  # GET /estoquemps/1.json
  def show
    if logged_in? && current_user.cliente.estoque_mp == "Sim"
      if Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).empty?
        redirect_to new_estoquemp_path
        flash[:danger] = "Você não possui itens em estoque ainda para mostrar. Por favor atualize seu estoque primeiro."
      end
      #@estoquemp = Estoquemp.where(cliente_id: current_user.cliente_id).order(updated_at: :desc).group(:item)
      @estoquempcliente = Estoquemp.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
      @estoquempitens = Estoquemp.uniq.pluck(:item)
      @estoquemp = []
      @estoquempitens.each do |item|
        @estoquemp << @estoquempcliente.where(item: item).first
      end
      
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end
  
  def analise1
    if logged_in? && current_user.cliente.estoque_mp == "Sim"
      @estoquemp_itens = Estoquemp.uniq.pluck(:item)
      @estoquemp = Estoquemp.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /estoquemps/new
  def new
    if logged_in? && current_user.cliente.estoque_mp == "Sim"
      @estoquemp = Estoquemp.new
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /estoquemps/1/edit
  def edit
    if logged_in?
      @estoquemp = Estoquemp.new
    else
      redirect_to root_path
      flash[:danger] = "Você precisa estar logado para realizar esta ação."
    end
  end
  

  # POST /estoquemps
  # POST /estoquemps.json
  def create
    @estoquemp = Estoquemp.new(estoquemp_params)
    @estoquemp.cliente_id = current_user.cliente_id
    
    
      if !Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).empty? && @estoquemp.atualizar == "Entrada"
        quantidade_velha = Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).last.quantidade_atual
        quantidade_nova = @estoquemp.quantidade_atual
        @estoquemp.quantidade_atual = quantidade_nova + quantidade_velha
      end
    
    
      if !Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).empty? && @estoquemp.atualizar == "Saída"
        quantidade_velha = Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).last.quantidade_atual
        quantidade_nova = @estoquemp.quantidade_atual
        @estoquemp.quantidade_atual = quantidade_velha - quantidade_nova
        @estoquemp.fornecedor = Estoquemp.where(cliente_id: current_user.cliente_id, item: @estoquemp.item).last.fornecedor
      end
    
    
    respond_to do |format|
      if @estoquemp.save
        format.html { redirect_to new_estoquemp_path, flash: { success: 'Item adicionado com sucesso ao estoque' } }
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
    @estoquemp = Estoquemp.new(estoquemp_params)
    
   
    respond_to do |format|
      if @estoquemp.update(estoquemp_params)
        format.html { redirect_to saidamp_path, flash: { success: 'Estoque foi atualizado com sucesso!' } }
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
      if !Estoquemp.where(cliente_id: current_user.cliente_id).exists?
        redirect_to root_path
        flash[:danger] = "Voce não possui itens cadastrados no estoque ainda!"
      else
        @estoquemp = Estoquemp.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estoquemp_params
      params.require(:estoquemp).permit(:cliente_id, :item, :quantidade_atual, :fornecedor, :atualizar)
    end
end
