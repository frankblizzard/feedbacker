class ClientsController < ApplicationController
  load_and_authorize_resource :client
  
  before_filter :login_required
  def index
    @search = Client.search(params[:search])  
    if @search
      @clients = @search.order("name asc")
    else
      @clients = Client.order("name asc")
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(params[:client])
    if @client.save
      flash[:notice] = "Successfully created client."
      redirect_to @client
    else
      render :action => 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(params[:client])
      flash[:notice] = "Successfully updated client."
      redirect_to clients_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash[:notice] = "Successfully destroyed client."
    redirect_to clients_url
  end
end
