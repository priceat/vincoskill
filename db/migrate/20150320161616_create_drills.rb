class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :name
      t.string :description
      t.string :pointers
      t.string :video
      t.timestamps
    end
  end
end
