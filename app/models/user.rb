class User < ActiveRecord::Base
  has_many :workouts
  belongs_to :team
  has_many :teams
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
