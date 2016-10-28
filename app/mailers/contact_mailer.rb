class ContactMailer < ActionMailer::Base
  include MailerHelper
  helper :mailer
  default to: '50fpsocr@gmail.com'

  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
  end

  mail(from: email, subject: "Contact Form Message")
end