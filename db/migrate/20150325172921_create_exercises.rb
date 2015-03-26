class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.references :user, index: true
      t.references :workout, index: true
      t.boolean :complete, default: false
      
      t.timestamps
    end
  end
end
