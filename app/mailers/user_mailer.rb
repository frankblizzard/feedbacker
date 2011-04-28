class UserMailer < ActionMailer::Base  
  default :from => "no-reply@eve-images.de"  
  
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Registered")  
  end  
end