class User < ActiveRecord::Base
  has_many :workouts
  belongs_to :team
  has_many :teams
  after_create :set_age
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def set_age  
    bd = self.date_of_birth
    d = Date.today
      if bd.year == d.year
        self.age = 1
      else
        age = d.year - bd.year
        age = age - 1 if (
        bd.month > d.month or
            (bd.month >= d.month and bd.day > d.day)
        )
        self.age = age.to_i
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

end
