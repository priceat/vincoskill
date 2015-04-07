class AddSkillLevelToUsers < ActiveRecord::Migration
  def change
    add_column :users, :years_played, :integer
    add_column :users, :skill_level, :string
  end
end
