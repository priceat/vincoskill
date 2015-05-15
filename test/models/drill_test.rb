require 'test_helper'

class DrillTest < ActiveSupport::TestCase
   test "drill_difficulty" do
    50.times do 
    FactoryGirl.create(:drill)
    end
  u = FactoryGirl.create(:user)
  w = FactoryGirl.create(:workout, :user => u)
  assert_equal 'Beginner', w.workout_drills.first.drill.skill_level
  end
end
