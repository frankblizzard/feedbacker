# Load the rails application
require File.expand_path('../application', __FILE__)

ActiveRecord::Base.instance_eval do
  def 
    per_page; 15; 
  end
end

# Initialize the rails application
Feedbacker::Application.initialize!
