class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      flash[:notice] = "Successfully created contact."
      redirect_to clients_url
    else
      render :action => 'new'
    end
  end

  def edit
    if params[:user]
      @user = User.find(params[:user])
      @person = Person.find_or_initialize_by_user_id(params[:user])
    else
      @person = Person.find(params[:id])
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(params[:person])
      flash[:notice] = "Successfully updated person."
      redirect_to person_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    flash[:notice] = "Successfully destroyed person."
    redirect_to people_url
  end
end
