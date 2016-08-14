require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
#create test for the login feature
  test "should login" do
    dave = users(:one)
    #since we dont use a scaffold to generate the session controller
    #we define the test to use the POST HTTP Request using the controller
    #method :create and check to see the username and password are correct
    #we use dave.name to ensure that the name is the name of users(:one) defined above
    post :create, name: dave.name, password: 'secret'
    assert_redirected_to admin_url
    assert_equal dave.id, session[:user_id]
  end

#create test for failed login
  test "should fail login" do
    dave = users(:one)
    post :create, name: dave.name, password: 'wrong'
    assert_redirected_to login_url
  end

#create test for logout
  test "should logout" do
    #since we created the sessions controller without a model we have to
    #define the HTTP Request to use DELETE and the controller method to use
    #with it (:destroy)
    delete :destroy
    assert_redirected_to homepage_url
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
