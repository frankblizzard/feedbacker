ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
ActionMailer::Base.smtp_settings = {  
  :address              => "mailout.eve-images.de",  
  :port                 => 587,  
  :domain               => "eve-images.de",  
  :user_name            => "wp10556962-noreply",  
  :password             => "renderrender",  
  :authentication       => "plain", 
  :tls                  => true  
}