class Exercise < ActiveRecord::Base
  has_many :drills
  belongs_to :workout
  belongs_to :user
  before_create :populate_the_drill

  def populate_the_drill
    self.drills = Drill.limit(5).order("RANDOM()")
  end

end
