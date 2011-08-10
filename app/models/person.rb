class Person < ActiveRecord::Base
    attr_accessible :first_name, :last_name, :street, :city, :email, :zipcode, :birthday, :phone, :avatar, :country, :client_id, :user_id
    
    attr_accessor :full_name
    
    validates_presence_of :first_name, :last_name
    
    validates_presence_of :client_id
    
    #validates_uniqueness_of :user_id
    
    belongs_to :user
    belongs_to :client
    
    
    def full_name
      "#{first_name} #{last_name}"
    end
    
end
