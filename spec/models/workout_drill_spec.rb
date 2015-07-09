require 'rails_helper' 

describe WorkoutDrill do

  before do
    @drills = 50.times { FactoryGirl.create(:drill) }
    @user = FactoryGirl.create(:user)
    @workout = FactoryGirl.create(:workout)
    @workout.save
  end
    
  describe 'Workout_Drill count' do
    it "counts the number of workout_drills" do
      expect( @workout.workout_drills.count ). to eq (5)
    end
  end

  # describe "Workout_Drill complete_time" do
  #   it "keeps track of the time to complete a drill" do
  #     @workout.workout_drills.first.update_attributes(:complete => true)
  #     @workout.workout_drills.first.save
  #     expect( @workout.workout_drills.first). to eq (nil)
  #   end
  # end
end