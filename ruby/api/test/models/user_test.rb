require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "admin is admin" do
    u = users(:admin)
    assert u.admin?
    assert u.user?
    assert u.guest?
  end

  test "user is user" do
    u = users(:user)
    assert_not u.admin?
    assert u.user?
    assert u.guest?
  end

  test "guest is guest" do
    u = users(:guest)
    assert_not u.admin?
    assert_not u.user?
    assert u.guest?
  end
end
