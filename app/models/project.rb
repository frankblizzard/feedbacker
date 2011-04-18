class Project < ActiveRecord::Base
    attr_accessible :name, :started_at, :ends_at, :description, :user_tokens
    
    belongs_to :client
    
    has_many :assignments
    has_many :images
    has_many :users, :through => :assignments 
    has_many :hours
    
    attr_reader :user_tokens
    
    def user_tokens=(ids)
      self.user_ids = ids.split(',')
    end
    
    
end