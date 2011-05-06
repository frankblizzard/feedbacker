class Project < ActiveRecord::Base
    attr_accessible :project_nr, :name, :started_at, :ends_at, :description, :user_tokens, :client_id
    
    validates_presence_of :name, :project_nr
    
    validates_uniqueness_of :project_nr
    
    belongs_to :client
    
    before_destroy :ensure_no_hours
    
    has_many :assignments
    has_many :images
    has_many :users, :through => :assignments 
    has_many :hours
    has_many :plan_hours
    
    
    attr_reader :user_tokens
    
    def user_tokens=(ids)
      self.user_ids = ids.split(',')
    end
    
    def number_name
      "#{self.project_nr} - #{self.name}"
    end
    
    scope :search_by_name_or_number , lambda { |q|
       (q ? where(["project_nr LIKE ? or name LIKE ? or concat(project_nr, ' ', name) like ?", '%'+ q + '%', '%'+ q + '%','%'+ q + '%' ])  : {})
     }
    
    
    private

      def ensure_no_hours
        return false if self.hours.count > 0
      end

end
