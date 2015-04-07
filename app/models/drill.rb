class Drill < ActiveRecord::Base
  has_many :workout_drills
  mount_uploader :video, VideoUploader

  LEVELS = {
   "Beginner" => "beginner",
   "Intermediate" => "intermediate",
   "Advances" => "advanced"
  }
end
