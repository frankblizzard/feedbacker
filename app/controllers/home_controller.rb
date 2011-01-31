class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    # get current user
    
    user = current_user
    
    @projects = Project.order("created_at")
    
    
    
    
    # connect users & projects through assignments table
    
  end

end
