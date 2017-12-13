class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

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

  # GET /items/1/edit
  def edit
    redirect_to root_path
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @item.cliente_id = current_user.cliente_id
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to new_item_path, flash: { success: 'Item criado com sucesso.' } }
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
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
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
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:item_name, :barcode, :cliente_id)
    end
end
