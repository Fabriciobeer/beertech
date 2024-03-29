class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  helper_method :current_cliente

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def current_cliente
  @current_cliente ||= Cliente.find(session[:cliente_id]) if session[:cliente_id]
end

def logged_in?
  !!current_user
end

def require_user
  if !logged_in?
    flash[:danger] = "Você deve estar logado para realizar esta ação"
    redirect_to root_path
  end
end



end
