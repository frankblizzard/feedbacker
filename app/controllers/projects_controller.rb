class ProjectsController < ApplicationController    
  before_filter :login_required
  
  helper_method :sort_column, :sort_direction  
   
  uses_tiny_mce :options => {  :theme => 'simple', :editor_selector => 'mceEditor'}
  
  def index
    @search = Project.search(params[:search])  
    if @search
      @projects = @search.all
    else
      @projects = Project.all
    end
    
    respond_to do |format|
      format.html
      format.xml { render :xml => @projects }
    end
  end

  def show
    @project = Project.find(params[:id])
    @users = User.all
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
    @project.destroy
    flash[:notice] = "Successfully destroyed project."
    redirect_to projects_url
  end  
  
  private
                                                     
  def sort_column
    Project.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
     
  def sort_direction
    %w["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
