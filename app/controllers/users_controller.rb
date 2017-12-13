class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end
  
  #alterar aqui para admin inserir novos usuários
  def new2
    if logged_in? && (current_user.nivel_usuario == "admin")
      @user = User.new
      @usercadastrados = User.where(cliente_id: current_user.cliente_id)
    end
  end

  # GET /users/1/edit
  def edit
    
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    
    if @user.new_record? && !logged_in?
      @user.cliente = Cliente.last 
      if User.where(cliente_id: Cliente.last.id).take == nil
        @user.nivel_usuario = "admin"
      else
        @user.nivel_usuario = "comum"
      end
    end
    if @user.new_record? && logged_in?
      @user.cliente = current_user.cliente
      @user.nivel_usuario = "comum"
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, flash: { success: 'Usuário criado com sucesso!' } }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #alterar aqui para admin criar novos usuários
  def create_new_user_from_admin
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to criarsegundouser_path, flash: { success: 'Usuário foi atualizado com sucesso.' } }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to criarsegundouser_path, flash: { success: 'Usuário foi excluído com sucesso.' } }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nome, :sobrenome, :email, :password, :username, :nivel_usuario, :cliente_id)
    end
    
end
