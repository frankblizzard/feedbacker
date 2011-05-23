class Project < ActiveRecord::Base
    attr_accessible :project_nr, :name, :started_at, :ends_at, :description, :user_tokens, :client_id, :created_by
    
    validates_presence_of :name, :project_nr
    
    validates_uniqueness_of :project_nr
    
    belongs_to :client
    
    before_destroy :ensure_no_hours
    
    has_many :assignments
    has_many :images, :dependent => :destroy
    has_many :users, :through => :assignments 
    has_many :hours
    has_many :plan_hours, :dependent => :destroy
    
    
    attr_reader :user_tokens, :name_number, :total_hours, :hours_on
    
    cattr_reader :per_page
    @@per_page = 25
    
    
    def total_hours(user=nil)
      if user
        hours = self.hours.where(:user => user)
      else
        hours = self.hours
      end
      hours.to_a.sum { |hour| hour.amount }
    end

    def self.hours_on(id=1, date=Date.today)
      hours = Project.hours.where("id = ? AND date <= ?",id, date)
      hours.to_a.sum { |hour| hour.amount }
    end
 
 
    def category_hours(category=nil)
      if category
        hours = self.hours.where(:work_category => category)
      else
        hours = self.hours
      end
      hours.to_a.sum { |hour| hour.amount }
    end   
    
    def user_tokens=(ids)
      self.user_ids = ids.split(',')
    end
    
    def name_number
      "#{self.project_nr} - #{self.name}"
    end
    
    
    protected

      def ensure_no_hours
        if self.hours.count > 0
          return false
        else
          return true
        end 
      end

end
