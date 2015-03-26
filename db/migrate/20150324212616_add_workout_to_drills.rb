class AddWorkoutToDrills < ActiveRecord::Migration
  def change
    add_column :drills, :exercise_id, :integer
    add_index :drills, :exercise_id
  end
end
