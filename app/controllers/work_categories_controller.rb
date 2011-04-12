class WorkCategoriesController < ApplicationController
  def index
    @work_categories = WorkCategory.all
  end

  def show
    @work_category = WorkCategory.find(params[:id])
  end

  def new
    @work_category = WorkCategory.new
  end

  def create
    @work_category = WorkCategory.new(params[:work_category])
    if @work_category.save
      flash[:notice] = "Successfully created work category."
      redirect_to @work_category
    else
      render :action => 'new'
    end
  end

  def edit
    @work_category = WorkCategory.find(params[:id])
  end

  def update
    @work_category = WorkCategory.find(params[:id])
    if @work_category.update_attributes(params[:work_category])
      flash[:notice] = "Successfully updated work category."
      redirect_to work_category_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @work_category = WorkCategory.find(params[:id])
    @work_category.destroy
    flash[:notice] = "Successfully destroyed work category."
    redirect_to work_categories_url
  end
end
