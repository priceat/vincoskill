class WelcomeController < ApplicationController
  def index
    if current_user && current_user.coach?
      redirect_to dashboard_coach_path
    elsif current_user && current_user.player?
      redirect_to dashboard_player_path
    elsif current_user && current_user.admin?
      redirect_to dashboard_admin_path
    end
  end

  def about
  end
end
