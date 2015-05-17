class PlayersController < ApplicationController

  def new
    @player = User.new
  end

  def show
     @team = current_user.teams.last
     @player = @team.players.find(params[:id])
     @workouts = @player.workouts.paginate(page: params[:page], per_page: 10)
  end

  def create
    email = params[:email]
    team = current_user.coaching_team
    user = User.where(:email => email).first
    user.update_attributes(:team_id => team.id)
      redirect_to dashboard_coach_path
  end

  def edit
    @player = current_user.id
  end

  def update
    @player = current_user
    if @player.update(player_params)
      @player.validate_age
      @player.set_skill_level
      redirect_to dashboard_player_path
    end
  end

  private

  def player_params
    params.require(:user).permit(:date_of_birth, :years_played, :team_id, :role)
  end
   
end
