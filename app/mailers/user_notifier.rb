class UserNotifier < ApplicationMailer
  default from: "Erin at Brandywine <no-reply@thebrandywinefurniture.net>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.welcome.subject
  #
  def welcome(user)
    @user = user
    mail to: user.email, subject: "Welcome, please activate your account"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.lost_password.subject
  #
  def lost_password(user)
    @user = user
    mail to: user.email, subject: "Lost Password"
  end

#mail it for SNS notification process
  def mail_it(email, body_text)
    @email = email
    @body_text = body_text
    mail(to: email, subject: 'Simple test of AWS SES')
  end

end
