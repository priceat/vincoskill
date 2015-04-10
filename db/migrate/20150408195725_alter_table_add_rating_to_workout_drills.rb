class AlterTableAddRatingToWorkoutDrills < ActiveRecord::Migration
  def change
    remove_column :workout_drills, :rating
    add_column :workout_drills, :rating, :integer, default: 1
  end
end
