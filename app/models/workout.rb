class Workout < ActiveRecord::Base
  belongs_to :user
  has_many :workout_drills
  has_many :drills, through: :workout_drills
  after_create :populate_the_drills!

  def populate_the_drills!
    drill_limit = 0
    if self.user.age.between?(1, 12)
      drill_limit = 5
    elsif self.user.age.between?(13, 16)
      drill_limit = 7
    else
      drill_limit = 10
    end
    if self.user.skill_level == "Beginner" 
     drills = Drill.order("RANDOM()").where(:skill_level => "Beginner").limit(drill_limit)
     drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
   elsif self.user.skill_level == "Intermediate" 
     drills = Drill.order("RANDOM()").where(:skill_level => "Beginner" || "Intermediate").limit(drill_limit)
     drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
   else self.user.skill_level == "Advanced" 
     drills = Drill.order("RANDOM()").limit(drill_limit)
     drills.each {|d| self.workout_drills.create(:drill_id => d.id, :workout_id => self.id)}
     end
  end

  def workout_average
    self.workout_drills.average(:rating).round
  end

end
