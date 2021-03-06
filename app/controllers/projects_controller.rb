class ProjectsController < ApplicationController    
  before_filter :login_required
  
  load_and_authorize_resource :project
  
  helper_method :sort_column, :sort_direction  
   
  uses_tiny_mce :options => {  :theme => 'simple', :editor_selector => 'mceEditor'}

  

  def index
    
    if current_user.works_at_eve?
      @search = Project.visible.search(params[:search])
      if @search
        @projects = @search.order(sort_column + ' ' + sort_direction) 
      else
        @projects = Project.visible.order(sort_column + ' ' + sort_direction) 
      end
    else
      @search = Project.visible.where(:client_id => current_user.client_id).search(params[:search])
      if @search
        @projects = @search.order(sort_column + ' ' + sort_direction) 
      else
        @projects = Project.visible.where(:client_id => current_user.client_id).order(sort_column + ' ' + sort_direction) 
      end
    end
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @projects }
    end
  end

  def show
    @project = Project.find(params[:id], :include => [:plan_hours, :user_plan_hours, :hours])
    @users = User.all
    @key_data = KeyData.all
    @categories = WorkCategory.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Successfully created project."
      redirect_to @project
    else
      render :action => 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to project_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.ensure_no_hours
     flash[:notice] = "Successfully destroyed project." 
     @project.destroy
    else
     flash[:error] = "Project can not be destroyed due to hours that have been booked on it." 
    end
     
    redirect_to projects_url
  end  
  
  
  private  
                                                     
  def sort_column
    params[:sort] ? params[:sort] : "project_nr"
  end
     
  def sort_direction
    params[:direction] ? params[:direction] : "desc"
  end
end
