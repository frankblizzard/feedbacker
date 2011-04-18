class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]
  
  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render :json => @users.map(&:attributes) }
    end
  end
  
  def new
    @user = User.new
  end  
  
  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your profile has been updated."
      redirect_to "/"
    else
      render :action => 'edit'
    end
  end 
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted."
    redirect_to users_url
  end
  
end