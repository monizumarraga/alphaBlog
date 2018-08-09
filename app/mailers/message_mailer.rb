class MessageMailer < ActionMailer::Base
  default :from => ENV["SENDGRID_MAIL_USERNAME"]

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def contact_me(message)
    content = Content.new(
      type: 'text/html',
      value: message.body
      )

    mail( 
      :to => message.to,
      :from => message.email,
      :contents => content,
      :subject => 'CV List contact mail from '+ message.email)
  end
end