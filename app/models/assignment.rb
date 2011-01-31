class Assignment < ActiveRecord::Base
    attr_accessible :user_id, :project_id
    #associations
    belongs_to :user
    belongs_to :project
end
