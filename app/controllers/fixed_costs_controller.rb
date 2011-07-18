class FixedCostsController < ApplicationController
  def index
    @fixed_costs = FixedCost.all
  end

  def show
    @fixed_cost = FixedCost.find(params[:id])
  end

  def new
    @fixed_cost = FixedCost.new
  end

  def create
   @fixed_cost = FixedCost.create!(params[:fixed_cost])  
  end

  def edit
    @fixed_cost = FixedCost.find(params[:id])
  end

  def update
    @fixed_cost = FixedCost.find(params[:id])
    if @fixed_cost.update_attributes(params[:fixed_cost])
      flash[:notice] = "Successfully updated fixed cost."
      redirect_to fixed_cost_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @fixed_cost = FixedCost.find(params[:id])
    @project = @fixed_cost.project
    @fixed_cost.destroy
    flash[:notice] = "Successfully deleted fix costs."
    redirect_to project_path(@project)
  end
end
