class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def admin
    @drills = Drill.all
  end

  def player
    @workouts = current_user.workouts.paginate(page: params[:page], per_page: 10)
  end

  private
end
