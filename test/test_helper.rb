ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'faker'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  class ActionController::TestCase
    include Devise::TestHelpers
    def setup
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end
  end

  def invite_new_user
  user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password", date_of_birth: nil, years_played: nil, role: "player")
  user
  end

  def create_new_workout
    user = FactoryGirl.create(:user)
    sign_in user
    workout = FactoryGirl.create(:workout)
    workout.workout_drills.destroy_all
    workout
  end

  def create_new_workout_no_drills
    user = FactoryGirl.create(:user)
    workout = FactoryGirl.create(:workout)
    workout.workout_drills.destroy_all
    workout
  end

end
