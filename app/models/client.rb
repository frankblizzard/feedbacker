class Client < ActiveRecord::Base
    attr_accessible :name, :contact_person, :phone, :email
    
    validates_presence_of :name
    
    validates_uniqueness_of :name
    
    has_many :projects
    has_many :users
    
    
end
