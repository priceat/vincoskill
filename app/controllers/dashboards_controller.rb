class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  # def 


  private

  def coach_info
    @user.coach?
  end

end
