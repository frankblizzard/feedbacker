class UserMailer < ActionMailer::Base  
  default :from => "no-reply@eve-images.de"  
  
  def registration_confirmation(user)  
    mail(:to => user.email, :subject => "Your registration for eve logR")  
  end  
end