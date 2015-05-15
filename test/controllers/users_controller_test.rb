require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  test "render_new" do
    user = FactoryGirl.create(:user)
    assert_equal 2, user.age
  end

  test "invite user" do
    user = invite_new_user
    assert_equal 100, user.age
  end


  test "update user" do
    user = invite_new_user
    user.update_attributes(:date_of_birth => '2015-04-06')
    assert_equal 0, user.age
  end

end
