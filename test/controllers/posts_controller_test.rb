require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create.rb user" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { content: @post.content, deleted_at: @post.deleted_at, status: @post.status, title: @post.title, user_id: @post.user_id } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test "should show user" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update user" do
    patch post_url(@post), params: { post: { content: @post.content, deleted_at: @post.deleted_at, status: @post.status, title: @post.title, user_id: @post.user_id } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy user" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
