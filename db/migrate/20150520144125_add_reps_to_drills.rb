class AddRepsToDrills < ActiveRecord::Migration
  def change
    add_column :drills, :reps, :integer
    add_column :drills, :drill_pattern, :string
    add_column :workout_drills, :distance, :integer
  end
end
