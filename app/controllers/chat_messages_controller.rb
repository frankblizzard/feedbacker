class ChatMessagesController < ApplicationController  

    def index  
        @messages = ChatMessage.all  
    end  
        
    def create  
        @message = ChatMessage.create!(params[:chat_message])  
    end  
      
end
