require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "welcome" do
    mail = UserNotifier.welcome
    assert_equal "Welcome", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "lost_password" do
    mail = UserNotifier.lost_password
    assert_equal "Lost password", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
