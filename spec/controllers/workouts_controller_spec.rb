# require 'rails_helper'

# describe WorkoutsController do 
  
#   include Devise::TestHelpers

#   before do
#     @user = create(:user)
#     @workout = create(:workout)
#     sign_in @user
#   end

#   describe '#create' do
#     it "creates a workout with workout_drills" do
#       expect( @user.workouts.last.workout_drills.count ).to eq (0)

#       post :create, { workout_id: @workout.id }

#       expect( @user.workouts.last.workout_drills.count ).to eq (5)
#     end
#   end
# end