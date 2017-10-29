require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should return true and allow login" do
    @user_second  = users(:two)
    auth = @user_second.authentication_by_image('TWFuIGlzIG')
    assert_equal auth, true
  end

  test "should return false and allow login" do
    @user_second  = users(:two)
    auth = @user_second.authentication_by_image('AqSQweSsq')
    assert_equal auth, false
  end

end
