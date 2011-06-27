class UserPlanHoursController < ApplicationController
  def index
    @user_plan_hours = UserPlanHour.all
  end

  def show
    @user_plan_hour = UserPlanHour.find(params[:id])
  end

  def new
    @user_plan_hour = UserPlanHour.new
  end

  def create
    user = User.find(params[:user_plan_hour][:user_id])
    params[:user_plan_hour][:individual_costs] = user.hourly_rate
    params[:user_plan_hour][:total_costs] = user.hourly_rate.to_f * params[:user_plan_hour][:amount].to_f * params[:user_plan_hour][:burden_costs].to_f
    @user_plan_hour = UserPlanHour.create!(params[:user_plan_hour])  
  end

  def edit
    @user_plan_hour = UserPlanHour.find(params[:id])
  end

  def update
    @user_plan_hour = UserPlanHour.find(params[:id])
    if @user_plan_hour.update_attributes(params[:user_plan_hour])
      flash[:notice] = "Successfully updated user plan hour."
      redirect_to user_plan_hour_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_plan_hour = UserPlanHour.find(params[:id])
    @project = @user_plan_hour.project
    @user_plan_hour.destroy
    flash[:notice] = "plan hour deleted."
    redirect_to project_path(@project)
  end
end
