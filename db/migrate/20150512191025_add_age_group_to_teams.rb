class AddAgeGroupToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :age_group, :integer
  end
end
