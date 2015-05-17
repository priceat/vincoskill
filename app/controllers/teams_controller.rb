class TeamsController < ApplicationController
  before_action :authenticate_user!

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
    @team = current_user.teams.create(team_params)

     if @team.valid?
      redirect_to dashboard_coach_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
    @user = current_user
    @team = @user.teams.last.id
  end

  def update
    @team = current_user.teams.last
    if @team.update_attributes(params.require(:team).permit(:name, :age_group))
       flash[:notice] = "Team updated."
       redirect_to dashboard_coach_path
     else
       flash[:error] = "There was an error saving the team. Please try again."
       render :edit
     end
   end


  def destroy
     @team = Team.find(params[:id])
     name = @team.name
 
     if @team.destroy
       flash[:notice] = "\"#{name}\" was deleted successfully."
       redirect_to dashboard_path
     else
       flash[:error] = "There was an error deleting the list."
       render :show
     end
  end

   private

   def team_params
    params.require(:team).permit(:name, :age_group)
   end

end
