class WorkoutDrill < ActiveRecord::Base
  belongs_to :workout
  belongs_to :drill

  def complete?
    complete == true
  end

end
