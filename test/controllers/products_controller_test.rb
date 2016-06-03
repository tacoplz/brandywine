require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { title: @product.title, description: @product.description, furniture_dimensions: @product.furniture_dimensions, furniture_stain: @product.furniture_stain, furniture_type: @product.furniture_type, furniture_wood: @product.furniture_wood, image_url: @product.image_url, room_for_furniture: @product.room_for_furniture }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { title: @product.title, description: @product.description, furniture_dimensions: @product.furniture_dimensions, furniture_stain: @product.furniture_stain, furniture_type: @product.furniture_type, furniture_wood: @product.furniture_wood, image_url: @product.image_url, room_for_furniture: @product.room_for_furniture }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
