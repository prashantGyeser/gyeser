ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gyeser.com",  
  :user_name            => "notifications@gyeser.com",  
  :password             => "WINSTAR1",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
