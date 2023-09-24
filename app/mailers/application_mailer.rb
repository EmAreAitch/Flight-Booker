class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name('rahibhasan95@gmail.com','Flight Booker')
  layout "mailer"

  
end
