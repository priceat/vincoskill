class Team < ActiveRecord::Base
  belongs_to :coach, :class_name => "User", :foreign_key => 'user_id'# this is the coach
  has_many :players, :class_name => "User" # these are the players

  # Team.first.user # -> coach
  # Team.first.users # -> players
end
