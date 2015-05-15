class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def admin
    @drills = Drill.all
  end

  def player
    @user = current_user
    @workouts = current_user.workouts.paginate(page: params[:page], per_page: 10)
  end

  def coach
    @team = current_user.teams.last
    @player = @team.players
  end

  private
end
