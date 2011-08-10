class Client < ActiveRecord::Base
    attr_accessible :name, :full_name
    
    validates_presence_of :name
    
    validates_uniqueness_of :name
    
    has_many :projects
    has_many :users
    
    has_many :people
       
end
