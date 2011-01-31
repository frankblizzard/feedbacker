class Project < ActiveRecord::Base
    attr_accessible :name, :started_at, :ends_at, :description
    
    has_many :assignments
    has_many :users, :through => :assignments 
end
