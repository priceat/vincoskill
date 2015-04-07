class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_drills
  has_many :drills, through: :workout_drills
  after_create :populate_the_drills!

  def populate_the_drills!
    if self.user.age <= 12
      drills = Drill.order("RANDOM()").limit(5)
      drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
    elsif self.user.age <= 16
      drills = Drill.order("RANDOM()").limit(7)
      drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
    else
      drills = Drill.order("RANDOM()").limit(10)
      drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
    end
  end

end
