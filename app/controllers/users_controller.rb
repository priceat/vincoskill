class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @team = current_user.team
    
    if @user.valid?
      redirect_to dashboard_coach_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @team = @user.teams.last
    
   if @user.role == "player"
     if @user.update_attributes(secure_params) 
      redirect_to dashboard_player_path, :notice => "Let's Go!"
    else
      redirect_to dashboard_player_path, :alert => "Not a Valid Age!"
    end
   else
      if @user.update_attributes(secure_params) 
      redirect_to dashboard_player_path, :notice => "User Updated"
      else
      redirect_to dashboard_player_path, :alert => "Not a Valid Age!"
      end
    end
  end


  def destroy
    user = User.find(params[:id])
    
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role, :name, :date_of_birth, :years_played)
  end
end
