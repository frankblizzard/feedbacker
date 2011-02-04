module ApplicationHelper   
  def link_to_current_with_class(name, current_class, options = {}, html_options = {}, &block)
    link_to_unless_current(name, options, html_options) do
      options[:class] = current_class + " " + options[:class]
      link_to(name, options, html_options)
    end
  end 
  
 
 
     def sortable(column, title = nil)  
       title ||= column.titleize  
       direction = "asc"
       link_to title, :sort => column, :direction => direction  
     end   
end
