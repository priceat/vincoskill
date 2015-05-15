ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'faker'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #fixtures :all
  class ActionController::TestCase
    include Devise::TestHelpers
  end

  def invite_new_user
  user = User.create!(email: "test@test.com", password: "password", password_confirmation: "password", date_of_birth: nil, years_played: nil, role: "player")
  user
  end
end
