require 'test_helper'

class FurnitureRoomsControllerTest < ActionController::TestCase
  setup do
    @furniture_room = furniture_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:furniture_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create furniture_room" do
    assert_difference('FurnitureRoom.count') do
      post :create, furniture_room: { room_type: @furniture_room.room_type }
    end

    assert_redirected_to furniture_room_path(assigns(:furniture_room))
  end

  test "should show furniture_room" do
    get :show, id: @furniture_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @furniture_room
    assert_response :success
  end

  test "should update furniture_room" do
    patch :update, id: @furniture_room, furniture_room: { room_type: @furniture_room.room_type }
    assert_redirected_to furniture_room_path(assigns(:furniture_room))
  end

  test "should destroy furniture_room" do
    assert_difference('FurnitureRoom.count', -1) do
      delete :destroy, id: @furniture_room
    end

    assert_redirected_to furniture_rooms_path
  end
end
