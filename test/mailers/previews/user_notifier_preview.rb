# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/welcome
  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def welcome
    user = User.find(7)
    user.activation_token = User.new_token
    UserNotifier.welcome(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def lost_password
    user = User.find(7)
    UserNotifier.lost_password
  end

end
