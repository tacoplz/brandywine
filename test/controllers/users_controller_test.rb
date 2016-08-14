require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end
#since we changed the create method to redirect to users_path, the test method was updated
#add users to fixtures/users.yml fixtures as well
  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { name: 'sam', password: 'secret', password_confirmation: 'secret' }
    end

    assert_redirected_to users_path
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  #since we changed the update method to redirect to users_path, the test method was updated
  test "should update user" do
    patch :update, id: @user, user: { name: @user.name, password: 'secret', password_confirmation: 'secret' }
    assert_redirected_to users_path
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
