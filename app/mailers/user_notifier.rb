class UserNotifier < ApplicationMailer
  default from: "brandywinefurniture@yahoo.com"
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

end
