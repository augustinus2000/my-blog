require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)  # FactoryBot을 사용해 유저 생성
    @post = create(:post, user: @user)  # 유저와 연결된 게시글 생성
    sign_in @user  # Devise 로그인 (필요한 경우)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end


  test "should create post" do
    assert_difference("Post.count", 1) do
      post posts_url, params: { post: { body: @post.body, title: @post.title, category: "Tech", user_id: @user.id } }
    end
    assert_redirected_to post_url(Post.last)
  end
  

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { body: "수정된 본문", title: "수정된 제목" } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end
end
