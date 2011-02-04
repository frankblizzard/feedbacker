class Image < ActiveRecord::Base
    attr_accessible :id, :project_id, :uploaded_at, :name, :rendering
    belongs_to :project                             
    
    has_many :comments
    
    #paperclip
     has_attached_file :rendering,
        :styles => {
          :thumb=> "100x100#",
          :small  => "400x400>" }
end
