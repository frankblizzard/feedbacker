class Announcement < ActiveRecord::Base
    attr_accessible :message, :starts_at, :ends_at
    
    
    def self.current_announcements(hide_time)
      with_scope :find => { :conditions => "starts_at <= now() AND ends_at >= now()" } do
        if hide_time.nil?
          find(:all)
        else
          find(:all, :conditions => ["updated_at > ? OR starts_at > ?", hide_time, hide_time])
        end
      end
    end

    
end
