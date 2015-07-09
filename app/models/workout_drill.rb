class WorkoutDrill < ActiveRecord::Base
  belongs_to :workout
  belongs_to :drill
  include RankedModel
  ranks :row_order, :with_same => :workout_id
  after_create :set_distance

  def set_distance
    if self.workout.user.age.between?(1, 10)
      self.distance = 8
    elsif self.workout.user.age.between?(11, 15)
      self.distance = 10
    else
      self.distance = 15
    end
    self.save
  end

  def create_real_rating
    if self.complete_time.between?(1, 100)
      self.real_rating = 1
    elsif self.complete_time.between?(101, 200)
      self.real_rating = 2
    elsif self.complete_time.between?(201, 300)
      self.real_rating = 3
    elsif self.complete_time.between?(301, 400)
      self.real_rating = 4
    else
      self.real_rating = 5
    end
    self.save
  end

   RATINGS = {
   "Very Easy" => 1,
   "Easier" => 2,
   "Intermediate" => 3,
   "Somewhat Difficult" => 4,
   "Very Difficult" => 5
  }

  def complete?
    complete == true
  end

  def next_drill
    workout_drill = workout.workout_drills.where("row_order > ?", self.row_order).rank(:row_order).first
    return workout_drill
  end

  def set_complete_time
    self.complete_time = 0
    first_drill = self.workout.workout_drills.first
    previous_drill = self.workout.workout_drills.where.not(:complete_time => 0).last
    if self == first_drill
      start_time = first_drill.created_at
      end_time = first_drill.updated_at
      seconds_diff = (start_time - end_time).to_i.abs
      self.complete_time = seconds_diff
    else
      start_time = self.updated_at
      end_time = previous_drill.updated_at
      seconds_diff = (start_time - end_time).to_i.abs
      self.complete_time = seconds_diff
    end
    self.save
  end
 
end
