require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)  # ✅ FactoryBot으로 유저 생성
    sign_in @user  # ✅ Devise 로그인
  end

  test "should get profile" do
    get profile_url(@user)  # ✅ user_url이 아니라 profile_url 사용
    assert_response :success
  end  
end
