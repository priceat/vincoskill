class AddRealRatingToWorkoutDrills < ActiveRecord::Migration
  def change
    add_column :workout_drills, :real_rating, :integer,  default: 1
    add_column :workout_drills, :complete_time, :integer, default: 0
  end
end
