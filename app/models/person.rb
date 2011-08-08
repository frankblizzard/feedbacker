class Person < ActiveRecord::Base
    attr_accessible :first_name, :last_name, :street, :city, :zipcode, :birthday, :phone, :avatar, :country, :client_id
    
    attr_accessor :full_name
    
    validates_presence_of :first_name, :last_name
    
    validates_presence_of :client_id
    
    validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
    
    belongs_to :user
    belongs_to :client
    
    
    def full_name
      "#{first_name} #{last_name}"
    end
    
end
