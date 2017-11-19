class SessionsController < ApplicationController

def new
    redirect_to root_path if logged_in?
end

def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in"
        redirect_to dashboard_path
    else
        flash.now[:danger] = "As informações de login não estão corretas"
        render 'new'
    end
end

def destroy
    session[:user_id] = nil
    flash[:success] = "Você deslogou com sucesso"
    redirect_to root_path
end

end