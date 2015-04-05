class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def admin
    @drills = Drill.all
  end

  def player
    @workouts = current_user.workouts.all
  end

  private
end
