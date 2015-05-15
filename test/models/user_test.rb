require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "new_user" do
  u = FactoryGirl.create(:user)
  assert_equal 'Advanced', u.skill_level
 end
end
