ActionMailer::Base.delivery_method = :smtp # be sure to choose SMTP delivery
ActionMailer::Base.smtp_settings = {  
  :address              => "mailout.eve-images.de",  
  :port                 => 587,  
  :domain               => "eve-images.de",  
  :user_name            => "wp10556962-noreply",  
  :password             => "renderrender",  
  :authentication       => "plain", 
  :enable_starttls_auto => false,
  :openssl_verify_mode => 'none'
}

ActionMailer::Base.default_url_options[:host] = "192.168.2.200:3000"  