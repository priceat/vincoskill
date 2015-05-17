class AlterTableAddRatingToWorkoutDrills < ActiveRecord::Migration
  def change
    add_column :workout_drills, :rating, :integer, default: 1
  end
end
