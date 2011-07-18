class FixedCost < ActiveRecord::Base
    attr_accessible :name, :amount, :project_id
    
    validates_presence_of :amount, :project_id, :name
    
    belongs_to :project
    
end
