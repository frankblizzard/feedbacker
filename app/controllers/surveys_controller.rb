class SurveysController < ApplicationController

  load_and_authorize_resource :survey
  
  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def new
    @survey = Survey.new
    if params[:image_id]
      @image = Image.find(params[:image_id])
      3.times { @survey.questions.build }  
    else 
      flash[:error] = "You can only create a survey from a image. Go to image/show and then use 'create new client survey'"
      redirect_to root_url
    end
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      flash[:notice] = "Successfully created survey."
      redirect_to @survey
    else
      render :action => 'new'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
    @image = @survey.image
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      flash[:notice] = "Successfully updated survey."
      redirect_to survey_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    flash[:notice] = "Successfully destroyed survey."
    redirect_to surveys_url
  end
end
