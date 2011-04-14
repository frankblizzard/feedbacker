class Hour < ActiveRecord::Base
    attr_accessible :date, :amount, :task, :extra, :user_id, :project_id, :work_category_id, :holiday
    
    validates_presence_of :date
    validates_presence_of :amount
    validates_presence_of :task
    validates_presence_of :project_id
    validates_presence_of :user_id
    
    belongs_to :user
    belongs_to :project
    belongs_to :work_category
end
