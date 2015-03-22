class User < ActiveRecord::Base
  has_many :workouts
  belongs_to :team
  has_many :teams
  # User.first.teams # -> teams you are coaching, probably an array of 0 for players, or 1+ for coaches depending if they can coach for multiple teams
  # User.first.team # -> the team you are on
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  ROLES = {
  	"Player" => "player",
  	"Coach" => "coach"
  }
  validates :role, inclusion: { in: ROLES.values + ['admin'] }

def player?
  self.role == 'player'
end

def coach?
  self.role == 'coach'
end

def admin?
  self.admin =='admin'
end
end
