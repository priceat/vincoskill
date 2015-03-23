class PlayersController < ApplicationController

  def new
  end

  def create
    email = params[:email]
    team = current_user.coaching_team
    user = User.where(:email => email).first
    user.update_attributes(:team_id => team.id)
      redirect_to dashboard_coach_path
  end
end
