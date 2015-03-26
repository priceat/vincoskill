class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :exercises
  has_many :drills, through: :exercises
  # before_create :make_exercises

  # def make_exercises
  #   self.exercises = Exercise.new
  # end

end
