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
     
     def broadcast(channel, &block)  
       message = {:channel => channel, :data => capture(&block), :ext => {:auth_token => FAYE_TOKEN} }  
       uri = URI.parse("http://localhost:9292/faye")  
       Net::HTTP.post_form(uri, :message => message.to_json)  
     end 
end
