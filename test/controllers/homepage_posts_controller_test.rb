require 'test_helper'

class HomepagePostsControllerTest < ActionController::TestCase
  setup do
    @homepage_post = homepage_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homepage_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homepage_post" do
    assert_difference('HomepagePost.count') do
      post :create, homepage_post: { post_img_url: @homepage_post.post_img_url, post_text: @homepage_post.post_text, post_title: @homepage_post.post_title }
    end

    assert_redirected_to homepage_post_path(assigns(:homepage_post))
  end

  test "should show homepage_post" do
    get :show, id: @homepage_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homepage_post
    assert_response :success
  end

  test "should update homepage_post" do
    patch :update, id: @homepage_post, homepage_post: { post_img_url: @homepage_post.post_img_url, post_text: @homepage_post.post_text, post_title: @homepage_post.post_title }
    assert_redirected_to homepage_post_path(assigns(:homepage_post))
  end

  test "should destroy homepage_post" do
    assert_difference('HomepagePost.count', -1) do
      delete :destroy, id: @homepage_post
    end

    assert_redirected_to homepage_posts_path
  end
end
