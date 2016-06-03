require 'test_helper'

class FurnitureTypesControllerTest < ActionController::TestCase
  setup do
    @furniture_type = furniture_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furniture_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture_type" do
    assert_difference('FurnitureType.count') do
      post :create, furniture_type: { furniture_room: @furniture_type.furniture_room, Type: @furniture_type.furniture_class }
    end

    assert_redirected_to furniture_type_path(assigns(:furniture_type))
  end

  test "should show furniture_type" do
    get :show, id: @furniture_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture_type
    assert_response :success
  end

  test "should update furniture_type" do
    patch :update, id: @furniture_type, furniture_type: { furniture_room: @furniture_type.furniture_room, furniture_class: @furniture_type.furniture_class }
    assert_redirected_to furniture_type_path(assigns(:furniture_type))
  end

  test "should destroy furniture_type" do
    assert_difference('FurnitureType.count', -1) do
      delete :destroy, id: @furniture_type
    end

    assert_redirected_to furniture_types_path
  end
end
