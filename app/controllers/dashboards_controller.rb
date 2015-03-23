class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def coach
  end


  private

  def coach_info
    @user.coach?
  end

end
