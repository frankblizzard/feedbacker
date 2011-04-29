class Project < ActiveRecord::Base
    attr_accessible :project_nr, :name, :started_at, :ends_at, :description, :user_tokens
    
    validates_presence_of :name, :project_nr
    
    belongs_to :client
    
    has_many :assignments
    has_many :images
    has_many :users, :through => :assignments 
    has_many :hours
    has_many :plan_hours
    
    attr_reader :user_tokens
    
    def user_tokens=(ids)
      self.user_ids = ids.split(',')
    end
    
    
end
