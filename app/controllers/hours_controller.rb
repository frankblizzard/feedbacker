class HoursController < ApplicationController
  before_filter :login_required
  
  def index
    @hours = Hour.all
  end

  def show
    @hour = Hour.find(params[:id])
  end
  
  def show_by_user
    @hours = Hour.find(params[:user_id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hours }
    end
  end
  

  def new
    @hour = Hour.new
  end

  def create
    @hour = Hour.new(params[:hour])
    if @hour.save
      flash[:notice] = "Successfully created hour."
      redirect_to @hour
    else
      render :action => 'new'
    end
  end

  def edit
    @hour = Hour.find(params[:id])
  end

  def update
    @hour = Hour.find(params[:id])
    if @hour.update_attributes(params[:hour])
      flash[:notice] = "Successfully updated hour."
      redirect_to hour_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy
    flash[:notice] = "Successfully destroyed hour."
    redirect_to hours_url
  end
end
