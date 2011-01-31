class Image < ActiveRecord::Base
    attr_accessible :name, :project_id, :uploaded_at
end
