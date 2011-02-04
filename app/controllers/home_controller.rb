class HomeController < ApplicationController
  before_filter :login_required
  
  def index
    # get current user
    
    user = current_user
    
    @projects = user.projects
    
    
    
    
    # connect users & projects through assignments table
    
  end

end
