require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:bob)
  end

  test "password resets" do
    get new_password_reset_path
    assert_template 'password_resets/new'
    #Invalid Email
    post password_resets_path, params: { password_reset: { email: "" } }
    #assert_redirected_to new_password_reset_path
    assert_not flash.empty?
    assert_template 'password_resets/new'
    #Password reset form_tag
    user = assigns(:user)
    #Wrong Email
    get edit_password_reset_path(user.reset_token, email: "")
    assert_redirected_to root_url
    #Inactive user
    user.toggle!(:activated)
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_redirected_to homepage_posts_path
    user.toggle!(:activated)
    #Right email, wrong token
    get edit_password_reset_path('wrong token', email: user.email)
    assert_redirected_to homepage_posts_path
    #Right Email, right token
    get edit_password_reset_path(user.reset_token, email: user.email)
    assert_template 'password_resets/edit'
    assert_select "input[name=email][type=hidden][value=?]", user.email
    #Invalid password & Confirmation
    patch password_reset_path(user.reset_token),
        params: { email: user.email,
                  user:  {  password:               "foobaz12!",
                            password_confirmation:  "boob1234!" } }
    assert_redirected_to new_password_reset_path
    #Empty password
    patch password_reset_path(user.reset_token),
    params: { email: user.email,
              user:  {  password:               "",
                        password_confirmation:  "" } }
    assert_redirected_to new_password_reset_path
    #Valid password & confirmation
    patch password_resets_path(user.reset_token),
        params: { email: user.email,
                  user:  {  password:               "foobaz12!",
                            password_confirmation:  "foobaz12!" } }
    assert_redirected_to homepage_posts_path
  end
end
