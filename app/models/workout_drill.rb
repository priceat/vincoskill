class WorkoutDrill < ActiveRecord::Base
  belongs_to :workout
  belongs_to :drill

  def complete?
    complete == true
  end

  def next_drill?
    workout.workout_drills.where("id > ?", id).first
  end

end
