require 'test_helper'

class FurnitureStylesControllerTest < ActionController::TestCase
  setup do
    @furniture_style = furniture_styles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furniture_styles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture_style" do
    assert_difference('FurnitureStyle.count') do
      post :create, furniture_style: { furniture_style: @furniture_style.furniture_style, furniture_style_image: @furniture_style.furniture_style_image }
    end

    assert_redirected_to furniture_style_path(assigns(:furniture_style))
  end

  test "should show furniture_style" do
    get :show, id: @furniture_style
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture_style
    assert_response :success
  end

  test "should update furniture_style" do
    patch :update, id: @furniture_style, furniture_style: { furniture_style: @furniture_style.furniture_style, furniture_style_image: @furniture_style.furniture_style_image }
    assert_redirected_to furniture_style_path(assigns(:furniture_style))
  end

  test "should destroy furniture_style" do
    assert_difference('FurnitureStyle.count', -1) do
      delete :destroy, id: @furniture_style
    end

    assert_redirected_to furniture_styles_path
  end
end
