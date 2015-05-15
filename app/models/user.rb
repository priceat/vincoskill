class User < ActiveRecord::Base
  has_many :workouts
  belongs_to :team
  has_many :teams
  after_create :set_skill_level, :if => :player?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :validate_age, :if => :player?

    def set_skill_level
      if self.years_played.nil? || self.years_played.between?(0, 1)
        self.skill_level = "Beginner"
      elsif self.years_played == 2
        self.skill_level = "Intermediate"
      else
        self.skill_level = "Advanced"
      end
      self.save
    end
 
 YEARSPLAYED = {
  "1st Timer! (Never Played Before)" => 0,
   "Less than 3 Years" => 1,
   "3 - 5 Years" => 2,
   "5 - 10 Years" => 3,
   "10 + Years" => 4
  }

    # def date_of_birth=(dob)
    #   dob = Date.strptime(dob, "%m/%d/%Y") rescue nil
    #   super(dob)
    # end

    def age
      return 100 if self.date_of_birth.nil?
      ((Time.now-self.date_of_birth.to_datetime)/1.year).floor
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
