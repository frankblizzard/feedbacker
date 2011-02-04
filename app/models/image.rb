class Image < ActiveRecord::Base
    attr_accessible :id, :project_id, :uploaded_at, :name, :rendering, :user_id
    belongs_to :project                             
    belongs_to :user
    
    validates_presence_of :name
    validates_presence_of :project_id      
    
    
    
    has_many :comments
    
    
    #paperclip
     has_attached_file :rendering,
        :styles => {
          :thumb=> "100x100#",
          :small  => "400x400#",
          :big => "850x850#" }
end
