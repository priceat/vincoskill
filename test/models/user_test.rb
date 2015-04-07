require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "new_user" do
  u = FactoryGirl.create(:user)
  # assert_equal 31, u.age
  assert_equal 'Beginner', u.skill_level
 end
end
