class Drill < ActiveRecord::Base
  has_many :workout_drills
  mount_uploader :video, VideoUploader

  LEVELS = {
   "Beginner" => "beginner",
   "Intermediate" => "intermediate",
   "Advanced" => "advanced"
  }

  REPS = {
    25 => 25, 
    30 => 30, 
    50 => 50
  }
end
