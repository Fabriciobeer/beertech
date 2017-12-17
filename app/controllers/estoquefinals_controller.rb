class EstoquefinalsController < ApplicationController
  before_action :set_estoquefinal, only: [:show, :edit, :update, :destroy]

  # GET /estoquefinals
  # GET /estoquefinals.json
  def index
    if logged_in? && current_user.cliente.estoque_final == "Sim"
      @estoquefinals = Estoquefinal.where(cliente_id: current_user.cliente_id)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /estoquefinals/1
  # GET /estoquefinals/1.json
  def show
    if logged_in? && current_user.cliente.estoque_final == "Sim"
      if Estoquefinal.where(cliente_id: current_user.cliente_id).empty?
        redirect_to new_estoquefinal_path
        flash[:danger] = "Você não possui itens em estoque ainda para mostrar. Por favor atualize seu estoque final primeiro."
      end
      @estoquefinalcliente = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
      @estoquefinalitens = Estoquefinal.where(cliente_id: current_user.cliente_id).uniq.pluck(:item_id)
      @estoquefinal = []
      @estoquefinalentrada = Estoquefinal.where(cliente_id: current_user.cliente_id, atualizar: "Entrada").order(updated_at: :desc)
      @estoquefinalsaida = Estoquefinal.where(cliente_id: current_user.cliente_id, atualizar: "Saída").order(updated_at: :desc)
      @estoquefinalitens.each do |item|
        @estoquefinal << @estoquefinalcliente.where(item: item).first
      end
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end
  
  def analise2
    if logged_in? && current_user.cliente.estoque_final == "Sim"
      @estoquefinalcliente = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
      @estoquefinal = Estoquefinal.where(cliente_id: current_user.cliente_id).order(updated_at: :desc)
      @estoquefinal_itens = []
      @estoquefinalitens = Estoquefinal.where(cliente_id: current_user.cliente_id).uniq.pluck(:item_id)
      @estoquefinalitens.each do |item|
        @estoquefinal_itens << @estoquefinalcliente.where(item: item).first
      end
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /estoquefinals/new
  def new
    if logged_in? && current_user.cliente.estoque_final == "Sim"
      @estoquefinal = Estoquefinal.new
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
    
  end
  
  def set_item_name
    @itemdata = Item.where(cliente_id: current_user.cliente_id, barcode: params[:barcode]).take
    
    if @itemdata != nil && @local != nil
      array = [@itemdata.id, @itemdata.item_name, @local.localizacao]
      respond_to do |format|
        format.html
        format.json {render json: @itemdata }
      end
    else
      array = [@itemdata.id, @itemdata.item_name, nil]
      respond_to do |format|
        format.html
        format.json {render json: @itemdata }
      end
    end
  end

  # GET /estoquefinals/1/edit
  def edit
    redirect_to root_path
  end

  # POST /estoquefinals
  # POST /estoquefinals.json
  def create  
    
    @estoquefinal = Estoquefinal.new(estoquefinal_params)
    @estoquefinal.cliente_id = current_user.cliente_id
    @estoquefinal.item_id = params[:item_id]
    
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
        if @estoquefinal.item.item_name.include? "arril"
          if Ciclovida.where(cliente_id: current_user.cliente_id, item_id: @estoquefinal.item_id).order(updated_at: :desc).first.tipo_cerveja != "" && @estoquefinal.atualizar == "Saída"   
            tipocerveja = Ciclovida.where(cliente_id: current_user.cliente_id, item_id: @estoquefinal.item_id).order(updated_at: :desc).first.tipo_cerveja
            Ciclovida.create(cliente_id: current_user.cliente_id, item_id: @estoquefinal.item_id, localizacao: @estoquefinal.destino, tipo_cerveja: tipocerveja)
          end
        end
        format.html { redirect_to new_estoquefinal_path, flash: { success: 'Estoque final foi atualizado com sucesso' } }
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
      params.require(:estoquefinal).permit(:barcode)
    end
end
