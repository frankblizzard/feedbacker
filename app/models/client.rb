class Client < ActiveRecord::Base
    attr_accessible :name, :contact_person, :phone, :email
    
    validates_presence_of :name
    
    validates_uniqueness_of :name
    
    has_many :projects
    
    cattr_reader :per_page
    @@per_page = 10
    
    
end
