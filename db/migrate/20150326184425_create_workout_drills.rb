class CreateWorkoutDrills < ActiveRecord::Migration
  def change
    create_table :workout_drills do |t|
      t.references :workout, index: true
      t.references :drill, index: true
      t.boolean :complete, default: false
      
      t.timestamps
    end
  end
end