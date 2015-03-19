class User < ActiveRecord::Base
  has_many :workouts

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :role, inclusion: { in: ['player', 'coach'] }

def player?
self.role == 'player'
end

def coach?
self.role == 'coach'
end

end
