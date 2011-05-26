class ChatMessagesController < ApplicationController  
  before_filter :login_required
    def index  
        @messages = ChatMessage.where( "created_at > ?", Time.now.in_time_zone - 60.minutes ).order("created_at desc")  
    end  
        
    def create  
        @message = ChatMessage.create!(params[:chat_message])  
    end  
      
end
