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
    
    cattr_reader :per_page
    @@per_page = 10
    
    attr_reader :user_tokens
    
    def user_tokens=(ids)
      self.user_ids = ids.split(',')
    end
    
    def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
    
    private

      def ensure_no_hours
        return false if self.hours.count > 0
      end

end
