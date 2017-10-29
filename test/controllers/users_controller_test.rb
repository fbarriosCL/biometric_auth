require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url, as: :json
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { email: @user.email, image: @user.image } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, image: @user.image } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json
    end

    assert_response 204
  end

  test "Not authorized" do
    post verify_user_url, params: nil, as: :json
    assert_response 401
  end

  test "should login with success" do
    post verify_user_url, params: { email: @user.email, image: @user.image }, as: :json
    assert_response 200
  end

  test "not login" do
    post verify_user_url, params: { email: @user.email, image: 'oqkqqwjdiusnas' }, as: :json
    assert_response 401
  end
end
