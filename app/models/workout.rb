class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :drills

  validates :title, :presence => true
end
