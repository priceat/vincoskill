require 'test_helper'

class WorkoutDrillsControllerTest < ActionController::TestCase
    # test "one workout drill complete time" do
    #   50.times do 
    #   FactoryGirl.create(:drill)
    #   end
    # user = FactoryGirl.create(:user)
    # sign_in user
    # w = create_new_workout
    # workout_drill = w.workout_drills.create(:created_at => "2015-06-15 18:00:00", :complete_time => 10)
    # workout_drill1 = w.workout_drills.create
    
    # put :update, id: workout_drill.id, :workout_drill => {complete: true, updated_at: "2015-06-15 18:00:59"}
    # put :update, id: workout_drill1.id, :workout_drill => {complete: true, updated_at: "2015-06-15 18:00:59"}

    # assert_equal (workout_drill.updated_at - workout_drill.created_at).to_i.abs, workout_drill.reload.complete_time
    # end

    # test "two workout drills complete time" do
    #   50.times do 
    #   FactoryGirl.create(:drill)
    #   end
    # user = FactoryGirl.create(:user)
    # sign_in user
    # w = FactoryGirl.create(:workout)
    # # w = create_new_workout
    # wo = w.workout_drills.first
    # wo1 = w.workout_drills.second
    
    # put :update, id: wo.id, :workout_drill => {complete: true}
    # w.save
    # put :update, id: wo1.id, :workout_drill => {complete: true}
    # w.save
    
    #  puts wo.reload.inspect
    #  puts wo1.reload.inspect

    #  assert_equal (wo1.updated_at - wo.updated_at).to_i.abs, wo1.reload.complete_time
    # end

end
