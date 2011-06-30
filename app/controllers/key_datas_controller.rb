class KeyDatasController < ApplicationController
  load_and_authorize_resource :key_data
  
  def index
    @key_datas = KeyData.all
  end

  def show
    @key_data = KeyData.find(params[:id])
  end

  def new
    @key_data = KeyData.new
  end

  def create
    @key_data = KeyData.new(params[:key_data])
    if @key_data.save
      flash[:notice] = "Successfully created key data."
      redirect_to key_datas_url
    else
      render :action => 'new'
    end
  end

  def edit
    @key_data = KeyData.find(params[:id])
  end

  def update
    @key_data = KeyData.find(params[:id])
    if @key_data.update_attributes(params[:key_data])
      flash[:notice] = "Successfully updated key data."
      redirect_to key_data_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @key_data = KeyData.find(params[:id])
    @key_data.destroy
    flash[:notice] = "Successfully destroyed key data."
    redirect_to key_datas_url
  end
end
