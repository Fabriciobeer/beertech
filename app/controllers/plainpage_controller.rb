class PlainpageController < ApplicationController

  def index
    if logged_in?
      
    end
    #flash[:success ] = "Success Flash Message: Welcome to BeerTech"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
    
  end

  def index2
    if !logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def index3
    if !logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def form
    if !logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end

  def form_advanced
    if !logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def form_validation
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def form_wizard
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def form_upload
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def form_buttons
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def general_elements
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def media_gallery
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def typography
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def icons
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end

  def glyphicons
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def widgets
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def invoice
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def inbox
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def calendar
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def tables
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def tables_dynamics
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def chartjs
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def chartjs2
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def morisjs
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def echarts
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  def other_charts
    if logged_in?
      flash[:danger] = "Você não tem permissão para isso"
      redirect_to root_path
    end
  end
  
  


end
