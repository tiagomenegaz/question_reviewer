require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should created user not to be admin" do
    user = User.create(email: "test@exemple.com", password: "App123")
    assert !user.admin?
  end

  test "should created user to be admin" do
    user = User.create(email: "test@exemple.com", password: "App123", admin: true)
    assert user.admin?
  end
end
