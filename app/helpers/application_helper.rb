module ApplicationHelper   
  def link_to_current_with_class(name, current_class, options = {}, html_options = {}, &block)
    link_to_unless_current(name, options, html_options) do
      options[:class] = current_class + " " + options[:class]
      link_to(name, options, html_options)
    end
  end 
  
  def current_announcements
    @current_announcements ||= Announcement.current_announcements(session[:announcement_hide_time])
  end

  def workdays(month)
    d1 = Date.new( Time.now.year, month, 1) #first day of month\period
    d2 = Date.new( Time.now.year, month, -1) #end day of month\period
    wdays = [0,6] #weekend days by numbers on week
    weekdays = (d1..d2).reject { |d| wdays.include? d.wday} #Day.wday number day in week
  end
 
  def sortable(column, title = nil)  
    title ||= column.titleize  
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil  
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"  
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
     
  def broadcast(channel, &block)  
    message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN} }  
    uri = URI.parse("http://localhost:9292/faye")  
    Net::HTTP.post_form(uri, :message => message.to_json)  
  end 
end
