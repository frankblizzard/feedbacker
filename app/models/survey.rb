class Survey < ActiveRecord::Base
    attr_accessible :name, :image_id, :questions_attributes
    
    validates_presence_of :name, :image_id
    
    belongs_to :image
    has_many :questions, :dependent => :destroy  
    accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true  
    
end
