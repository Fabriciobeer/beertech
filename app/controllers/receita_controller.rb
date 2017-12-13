class ReceitaController < ApplicationController
  before_action :set_receitum, only: [:show, :edit, :update, :destroy]

  # GET /receita
  # GET /receita.json
  def index
    if logged_in? && (current_user.cliente.estoque_mp == "Sim") && (current_user.nivel_usuario == "admin")
      @receita = Receitum.where(cliente_id: current_user.cliente_id)
    else
      redirect_to root_path
      flash[:danger] = "Você precisa estar logado para realizar essa ação."
    end
  end

  # GET /receita/1
  # GET /receita/1.json
  def show
    if logged_in? && (current_user.cliente.estoque_mp == "Sim") && (current_user.nivel_usuario == "admin")
      @receita = Receitum.where(cliente_id: current_user.cliente_id).group(:nome_receita)
    end
  end

  # GET /receita/new
  def new
    if logged_in? && current_user.cliente.estoque_mp == "Sim"
      @receitum = Receitum.new
    else
      redirect_to root_path
    end
  end

  # GET /receita/1/edit
  def edit
    if logged_in? && (current_user.cliente.estoque_mp == "Sim") && (current_user.nivel_usuario == "admin")
    end
  end

  # POST /receita
  # POST /receita.json
  def create
    @receitum = Receitum.new(receitum_params)
    @receitum.cliente_id = current_user.cliente_id
    respond_to do |format|
      if @receitum.save
        format.html { redirect_to new_receitum_path, flash: { success: 'Receita adicionada com sucesso' } }
        format.json { render :show, status: :created, location: @receitum }
      else
        format.html { render :new }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receita/1
  # PATCH/PUT /receita/1.json
  def update
    respond_to do |format|
      if @receitum.update(receitum_params)
        format.html { redirect_to receitum_path, flash: { success: 'Receita atualizada com sucesso' } }
        format.json { render :show, status: :ok, location: @receitum }
      else
        format.html { render :edit }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receita/1
  # DELETE /receita/1.json
  def destroy
    @receitum.destroy
    respond_to do |format|
      format.html { redirect_to new_receitum_path, flash: { success: 'Receita/ingrediente deletado com sucesso.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receitum
      @receitum = Receitum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receitum_params
      params.require(:receitum).permit(:cliente_id, :nome_receita, :itens_receita, :quantidade_usada, :unidade_receita)
    end
end
