class AnswersController < ApplicationController
  before_filter :login_required
  
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create!(params[:answer])  
    flash[:notice] = "Successfully saved answer."
    redirect_to @answer.question.survey
  end

  def edit
    @answer = answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Successfully updated answer."
      redirect_to answer_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = "answer deleted."
    redirect_to survey_path(@survey)    
  end
  
  
end
