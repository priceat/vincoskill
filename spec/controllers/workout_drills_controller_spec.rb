require 'rails_helper'

describe WorkoutDrillsController do 
  
  include Devise::TestHelpers

  before do
    login_user
    @drills = 50.times { FactoryGirl.create(:drill) }
    @workout = FactoryGirl.create(:workout)
    @workout_drill = @workout.workout_drills.first
  end

  describe '#create' do
    it "creates a workout with workout_drills" do
      expect( @workout.workout_drills.count ).to eq (5)

      expect( @workout_drill ).not_to be_nil
    end
  end

  describe '#update' do
    it "updates the time to complete a drill" do
       expect( @workout ).not_to be_nil
       expect( @workout_drill.complete_time ).to be_nil
        puts @workout.inspect
        puts user.inspect

      put :update, :id => @workout_drill.id, :workout_drill => @workout_drill.attributes = { :complete => true }

      expect( @workout_drill.complete_time ).to eq (0)
    end
  end
end