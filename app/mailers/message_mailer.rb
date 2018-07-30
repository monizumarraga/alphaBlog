class MessageMailer < ActionMailer::Base
  default :from => 'monizumarraga@hotmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def contact_me(message, to)
    mail( 
      :from => message.email,
      :to => to,
      :message => message.body,
      :subject => 'CV List contact mail' )
  end
end