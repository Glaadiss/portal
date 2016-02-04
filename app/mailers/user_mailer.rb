class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notice.subject
  #
  def notice(email,token)
    @greeting = "Hi"
    @email = email
    @mess = 'localhost:3000/messages/'+token
    mail to: email
  end
end
