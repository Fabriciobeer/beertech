class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :editbarril]

  # GET /items
  # GET /items.json
  def index
    if logged_in? && (current_user.cliente.ciclo_vida_barril == "Sim" || current_user.cliente.estoque_final == "Sim")
      @items = Item.where(cliente_id: current_user.cliente_id)
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    redirect_to root_path
  end

  # GET /items/new
  def new
    if logged_in? && (current_user.cliente.ciclo_vida_barril == "Sim" || current_user.cliente.estoque_final == "Sim")
      @item = Item.new
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end
  
  def newbarril
    if logged_in? && (current_user.cliente.ciclo_vida_barril == "Sim" || current_user.cliente.estoque_final == "Sim")
      @item = Item.new
    else
      redirect_to root_path
      flash[:danger] = "Você não está logado ou não possui permissão para isso."
    end
  end
  
  def editbarril
    
  end

  # GET /items/1/edit
  def edit
    
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.cliente_id = current_user.cliente_id
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to plainpage_index_path, flash: { success: 'Item criado com sucesso.' } }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to plainpage_index_path, flash: { success: 'Item atualizado com sucesso.' }  }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    Estoquefinal.where(cliente_id: current_user.cliente_id, item_id: @item.id).delete_all
    Ciclobarril.where(cliente_id: current_user.cliente_id, item_id: @item.id).delete_all
    @item.destroy
    respond_to do |format|
      format.html { redirect_to plainpage_index_path, flash: { success: 'Item foi deletado com sucesso.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      if !Item.where(cliente_id: current_user.cliente_id).exists?
        redirect_to root_path
        flash[:danger] = "Voce não possui itens cadastrados no estoque final ainda!"
      else
        @item = Item.where(cliente_id: current_user.cliente_id).first
      end
       
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :barcode, :cliente_id, :tamanho_barril)
    end
end
