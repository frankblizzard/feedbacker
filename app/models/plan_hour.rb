class PlanHour < ActiveRecord::Base
    attr_accessible :amount, :project_id, :work_category_id
    
    validates_presence_of :amount, :project_id, :work_category_id
    
    belongs_to :project
    belongs_to :work_category
    
end
