class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def admin
    @drills = Drill.all
  end

  def player
    @workout = current_user.workouts.all
  end

  private
end
