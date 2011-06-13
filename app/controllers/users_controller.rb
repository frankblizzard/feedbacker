class UsersController < ApplicationController
  load_and_authorize_resource :user
  
  before_filter :login_required
  
  def index
    @users = User.where("name like ?", "%#{params[:q]}%").order("name")
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
      UserMailer.registration_confirmation(@user).deliver  
      session[:user_id] = @user.id
      flash[:notice] = "Thank you for signing up! You are now logged in."
      redirect_to "/"
    else
      render :action => 'new'
    end
  end

  def edit
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def update
    @user = User.find(params[:id]) || current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profile has been updated."
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
