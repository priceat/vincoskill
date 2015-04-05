class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
