class User < ActiveRecord::Base
  has_many :workouts
  belongs_to :team
  has_many :teams
  after_create :set_skill_level
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :validate_age

    def age
      ((Time.now-self.date_of_birth.to_datetime)/1.year).floor
    end

    def set_skill_level
      if self.years_played.between?(0, 3)
        self.skill_level = "Beginner"
      elsif self.years_played.between?(4, 6)
        self.skill_level = "Intermediate"
      else
        self.skill_level = "Advanced"
      end
      self.save
    end
        

   ROLES = {
   "Player" => "player",
   "Coach" => "coach"
  }
  
  validates :role, inclusion: { in: ROLES.values + ['admin'] }

    def coaching_team
      self.teams.first
    end

    def player?
      self.role == 'player'
    end

    def coach?
      self.role == 'coach'
    end

    def admin?
      self.role =='admin'
    end

    def worked_out?
      self.workouts.present?
    end

    private

    def validate_age
      if self.age <= 0
        self.errors.add(:date_of_birth, "Not a valid age youngin!")
      end
    end

end
