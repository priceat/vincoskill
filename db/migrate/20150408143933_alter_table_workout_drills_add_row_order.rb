class AlterTableWorkoutDrillsAddRowOrder < ActiveRecord::Migration
  def change
    add_column :workout_drills, :row_order, :integer
    add_index :workout_drills, :row_order
  end
end
