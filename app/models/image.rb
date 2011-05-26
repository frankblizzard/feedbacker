class Image < ActiveRecord::Base
    attr_accessible :id, :project_id, :name, :rendering, :user_id
    belongs_to :project                             
    belongs_to :user
    
    validates_presence_of :name
    validates_presence_of :project_id      
    
    has_many :comments, :dependent => :destroy   
    
    has_many :surveys,  :dependent => :destroy  
    accepts_nested_attributes_for :surveys, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true  
    
    
    cattr_reader :per_page
    @@per_page = 5
    
    
    
    #paperclip
     has_attached_file :rendering,
        :styles => {
          :thumb=> "100x100>",
          :small  => "400x400>",
          :big => "850x850>" }
end
