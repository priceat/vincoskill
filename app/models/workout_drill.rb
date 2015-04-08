class WorkoutDrill < ActiveRecord::Base
  belongs_to :workout
  belongs_to :drill
  include RankedModel
  ranks :row_order, :with_same => :id

  def complete?
    complete == true
  end

  def next_drill
    workout_drill = workout.workout_drills.where("row_order > ?", self.row_order).rank(:row_order).first
    return workout_drill
  end
end
