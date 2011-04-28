class ChatMessage < ActiveRecord::Base
    attr_accessible :content, :user_id
    
    validates_presence_of :content
    
    belongs_to :user
    
end
