class HoursController < ApplicationController
  before_filter :login_required
#  skip_before_filter :verify_authenticity_token, :only => [:create]
#  skip_before_filter :login_required, :only => [:create]

  autocomplete :project, :name, :display_value => :name_number
  
  def get_autocomplete_items(parameters)
    items = Project.select("DISTINCT CONCAT_WS(' ', project_nr, name, id) AS full_name, project_nr, name, id").where(["CONCAT_WS(' ', project_nr, name) LIKE ?", "%#{parameters[:term]}%"])
  end

  
  
  def index
    if current_user.admin? 
      params[:user_id] ? @hours = Hour.where("user_id = ?", params[:user_id]).to_a : @hours = Hour.all
      params[:project_id] ? @hours = @hours.where("project_id = ?", params[:project_id]).to_a : @hours
    else
       @hours = current_user.hours
    end  
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
    respond_to do |format|
      format.html
      format.json { render :json => @hours.map(&:attributes) }
      format.xml  { render :xml  => @hours}
    end
  end

  def show
    @hour = Hour.find(params[:id])
  end
  
  def show_xml
    @hours = Hour.all
    render :xml => @hours
  end
  

  def new
    @hour = Hour.new
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def create
    @hour = Hour.new(params[:hour])
    if @hour.save
      flash[:notice] = "New Time record created."
      redirect_to hours_url
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
      flash[:notice] = "Successfully updated time record."
      redirect_to hour_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy
    flash[:notice] = "Successfully deleted time record."
    redirect_to hours_url
  end
end
