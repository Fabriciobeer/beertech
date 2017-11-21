class SessionsController < ApplicationController

def new
    redirect_to plainpage_index_path if logged_in?
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        session[:cliente_id] = user.cliente_id
        flash[:success] = "Você logou com sucesso"
        redirect_to plainpage_index_path
    else
        flash.now[:danger] = "As informações de login não estão corretas"
        render 'new'
    end
end

def destroy
    session[:user_id] = nil
    session[:cliente_id] = nil
    flash[:success] = "Você deslogou com sucesso"
    redirect_to root_path
end

end