# Preview all emails at http://localhost:3000/rails/mailers/user_notifier
class UserNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/welcome
  def welcome
    UserNotifier.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_notifier/lost_password
  def lost_password
    UserNotifier.lost_password
  end

end
