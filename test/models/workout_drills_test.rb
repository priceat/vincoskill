require 'test_helper'

class WorkoutDrillsTest < ActiveSupport::TestCase
  test "drill distance creation" do
    50.times do 
    FactoryGirl.create(:drill)
  end
  u = FactoryGirl.create(:user)
  w = FactoryGirl.create(:workout)

  assert_equal 8, w.workout_drills.first.distance 
  end

  test "workout drill set rating" do
   50.times do 
      FactoryGirl.create(:drill)
      end
    u = FactoryGirl.create(:user)
    w = FactoryGirl.create(:workout)
    w1 = w.workout_drills.first

    w1.update(:complete_time => 105)
    w1.save
    puts w1.inspect

    assert_equal 2, w1.real_rating

   end

end
