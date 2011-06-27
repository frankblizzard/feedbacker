class UserPlanHour < ActiveRecord::Base
    attr_accessible :user_id, :project_id, :amount, :individual_costs, :burden_costs, :total_costs
    
    validates_presence_of :amount, :project_id, :user_id
    
    belongs_to :project
    belongs_to :user
    
end
