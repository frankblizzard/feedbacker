class SessionsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token
  
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      session[:hour_user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to_target_or_default("/")
    else
      flash.now[:error] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    session[:hour_user_id] = nil
    flash[:notice] = "You have been logged out."
    redirect_to "/"
  end
end
