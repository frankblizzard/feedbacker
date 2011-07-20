class Person < ActiveRecord::Base
    attr_accessible :first_name, :last_name, :street, :city, :zipcode, :birthday, :phone, :avatar, :country_id
end
