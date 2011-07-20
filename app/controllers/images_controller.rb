class ImagesController < ApplicationController
  before_filter :login_required

 
  def index
    @images = Image.paginate :page => params[:page], :order => "created_at desc", :per_page => 15
  end

  def new
    @image = Image.new
  end        
  
  def show
    @image = Image.find(params[:id] )
    @comments = @image.comments.order("created_at desc")
  end

  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to images_path
    else
      render :action => 'new'
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      render :action => :show
    else
      render :action => 'edit'
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to images_url
  end 
  
  private
                                                     
  def sort_column
    params[:sort] ||= "name"
  end
     
  def sort_direction
    params[:direction] ||= "asc"
  end
  
end
