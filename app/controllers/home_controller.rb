class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    # get current user
    
    user = current_user
    
    @projects = user.projects
    
    @latest_images = Image.find(:all, :order => "created_at desc", :limit => 5)
    
    
    # connect users & projects through assignments table
    
  end

end
