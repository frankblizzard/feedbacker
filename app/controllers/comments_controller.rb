class CommentsController < ApplicationController
  before_filter :login_required, :get_image
  
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create!(params[:comment])  
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      flash[:notice] = "Successfully updated comment."
      redirect_to comment_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "comment deleted."
    redirect_to image_path(@image)    
  end
  
  
  def get_image
      @image = Image.find(params[:image_id]) if params[:image_id]
  end
  
  
end
