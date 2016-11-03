require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "welcome" do
    user = users(:bob)
    user.activation_token = User.new_token
    mail = UserNotifier.welcome(user)
    assert_equal "Welcome, please activate your account", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["brandywinefurniture@yahoo.com"], mail.from
    assert_match user.name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

  test "lost_password" do
    user = users(:bob)
    mail = UserNotifier.lost_password(user)
    assert_equal "Lost Password", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["brandywinefurniture@yahoo.com"], mail.from
    assert_match "Dear", mail.body.encoded
  end

end
