require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase
 test "new_workout" do
  50.times do 
    FactoryGirl.create(:drill)
  end
  w = FactoryGirl.build(:workout)
  assert_equal 0, w.workout_drills.count
  w.save
  assert_equal 5, w.workout_drills.count
  # w = FactoryGirl.create(:workout)
  # assert_equal 5, w.workout_drills.count
 end
end
