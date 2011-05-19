class PlanHoursController < ApplicationController
  def index
    @plan_hours = PlanHour.all
  end

  def show
    @plan_hour = PlanHour.find(params[:id])
  end

  def new
    @plan_hour = PlanHour.new
  end

  def create
    @plan_hour = PlanHour.create!(params[:plan_hour])  
  end

  def edit
    @plan_hour = PlanHour.find(params[:id])
  end

  def update
    @plan_hour = PlanHour.find(params[:id])
    if @plan_hour.update_attributes(params[:plan_hour])
      flash[:notice] = "Successfully updated plan hour."
      redirect_to plan_hour_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @plan_hour = PlanHour.find(params[:id])
    @plan_hour.destroy
    flash[:notice] = "plan hour deleted."
    redirect_to project_path(@project)
  end

end
