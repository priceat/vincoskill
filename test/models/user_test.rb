require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "new_user" do
  u = FactoryGirl.create(:user)
  assert_equal 31, u.age
  # u.save
  # assert_equal 31, u.age
 end
end
