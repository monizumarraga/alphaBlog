class MessageMailer < ActionMailer::Base
  default :from => ENV["SENDGRID_MAIL_USERNAME"]

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def contact_me(message)
    mail( 
      :to => message.to,
      :from => message.email,
      :content => [
                    {
                      "type": "text/plain",
                      "value": message.body
                    }
                  ],
      :subject => 'CV List contact mail from '+ message.email)
  end
end