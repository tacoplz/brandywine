class UserNotifier < ApplicationMailer
  default from: 'Erin at Brandywine <brandywinefurniture@yahoo.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_notifier.lost_password.subject
  #
  def lost_password
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
