class SessionsController < ApplicationController
  
  
  def new
    
  end
  
  
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_url, :notice => "your in"
    else
      render :new, :notice => "too bad"
    end
  end
  
  
  def destroy
    reset_session
    redirect_to sessions_new_url
    
  end
  
  
  
  
end
