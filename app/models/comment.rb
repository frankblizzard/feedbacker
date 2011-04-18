class Comment < ActiveRecord::Base
    attr_accessible :image_id, :user_id, :body    
    
    validates_presence_of :body
    
    belongs_to :user 
    belongs_to :image
    
end
