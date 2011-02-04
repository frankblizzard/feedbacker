class ImagesController < ApplicationController
  def index
    @images = Image.order(sort_column + " " + sort_direction) 
  end

  def new
    @image = Image.new
  end        
  
  def show
    @image = Image.find(params[:id] )
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
    Image.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
     
  def sort_direction
    %w["asc", "desc"].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
