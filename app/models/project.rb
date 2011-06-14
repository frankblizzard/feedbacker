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
    
    attr_reader :per_page
    @@per_page = 15
    
    
    scope :visible, where(:hidden => '0') 
    
    
    
    #  gives the total hours per user
    def total_hours(user=nil)
      if user
        hours = self.hours.where(:user => user)
      else
        hours = self.hours
      end
      hours.to_a.sum { |hour| hour.amount }
    end
    
    # sum of all plan hours in the project
    def total_plan_hours
      plan_hours.to_a.sum { |plan_hour| plan_hour.amount }
    end

    # cumulates the real hours of booked on the project for a given date
    def hours_on(date=Date.today)
      hours = self.hours.where("date <= ?", date)
      hours.to_a.sum { |hour| hour.amount }
    end

    # calculates the difference between plan hours and real hours on a given date
    def plan_hours_left(date=Date.today)
      hours = self.hours.where("date <= ?", date)
      sum_hours = hours.to_a.sum { |hour| hour.amount }
      sum_plan_hours = self.plan_hours.to_a.sum { |plan_hour| plan_hour.amount }
      difference = sum_plan_hours - sum_hours
    end

    #  gives the total hours per category 
    def category_hours(category=nil)
      if category
        hours = self.hours.where(:work_category => category)
      else
        hours = self.hours
      end
      hours.to_a.sum { |hour| hour.amount }
    end   

    # helper function for jQuery tokenized input
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
