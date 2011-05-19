class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    # get current user
    
    user = current_user
    
    @projects = Project.find(:all, :include => [:hours], :order => "hours.created_at desc", :limit => 8 )
    
    @latest_images = Image.find(:all, :order => "created_at desc", :limit => 25)
    
    
    # connect users & projects through assignments table
    
  end

end
