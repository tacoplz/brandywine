require 'test_helper'

class FurnitureStainsControllerTest < ActionController::TestCase
  setup do
    @furniture_stain = furniture_stains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furniture_stains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture_stain" do
    assert_difference('FurnitureStain.count') do
      post :create, furniture_stain: { stain_type: @furniture_stain.stain_type }
    end

    assert_redirected_to furniture_stain_path(assigns(:furniture_stain))
  end

  test "should show furniture_stain" do
    get :show, id: @furniture_stain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture_stain
    assert_response :success
  end

  test "should update furniture_stain" do
    patch :update, id: @furniture_stain, furniture_stain: { stain_type: @furniture_stain.stain_type }
    assert_redirected_to furniture_stain_path(assigns(:furniture_stain))
  end

  test "should destroy furniture_stain" do
    assert_difference('FurnitureStain.count', -1) do
      delete :destroy, id: @furniture_stain
    end

    assert_redirected_to furniture_stains_path
  end
end
