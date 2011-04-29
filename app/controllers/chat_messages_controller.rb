class ChatMessagesController < ApplicationController  

    def index  
        @messages = ChatMessage.where( "created_at > ?", Time.now.in_time_zone - 60.minutes )  
    end  
        
    def create  
        @message = ChatMessage.create!(params[:chat_message])  
    end  
      
end
