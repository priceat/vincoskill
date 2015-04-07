class AddSkillLevelToDrills < ActiveRecord::Migration
  def change
    add_column :drills, :skill_level, :string
  end
end
