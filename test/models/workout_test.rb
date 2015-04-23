require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
 test "new_workout" do
  50.times do 
    FactoryGirl.create(:drill)
  end
  u = FactoryGirl.create(:user)
  w = FactoryGirl.create(:workout)
  assert_equal 5, w.workout_drills.count
  assert_equal 1, w.workout_average
  w.workout_drills.first.update_attributes(:rating => 5)
  w.workout_drills.last.update_attributes(:rating => 5)
  assert_equal 3, w.workout_average
  # w = FactoryGirl.create(:workout)
  # assert_equal 5, w.workout_drills.count
 end
end
