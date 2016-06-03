require 'test_helper'

class FurnitureWoodsControllerTest < ActionController::TestCase
  setup do
    @furniture_wood = furniture_woods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furniture_woods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture_wood" do
    assert_difference('FurnitureWood.count') do
      post :create, furniture_wood: { wood_type: @furniture_wood.wood_type }
    end

    assert_redirected_to furniture_wood_path(assigns(:furniture_wood))
  end

  test "should show furniture_wood" do
    get :show, id: @furniture_wood
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture_wood
    assert_response :success
  end

  test "should update furniture_wood" do
    patch :update, id: @furniture_wood, furniture_wood: { wood_type: @furniture_wood.wood_type }
    assert_redirected_to furniture_wood_path(assigns(:furniture_wood))
  end

  test "should destroy furniture_wood" do
    assert_difference('FurnitureWood.count', -1) do
      delete :destroy, id: @furniture_wood
    end

    assert_redirected_to furniture_woods_path
  end
end
