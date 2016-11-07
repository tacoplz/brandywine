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
  # http://localhost:3000/rails/mailers/user_notifier/lost_password
  def lost_password
    user = User.find(7)
    user.reset_token = User.new_token
    UserNotifier.lost_password(user)
  end

end
