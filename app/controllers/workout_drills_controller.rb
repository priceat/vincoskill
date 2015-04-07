class WorkoutDrillsController < ApplicationController

  def index
    @workout_drills = current_user.workout_drills.all
  end

  def create
  end

  def show
     @workout = current_user.workouts.last
     @workout_drill = @workout.workout_drills.where(:complete => false).first
    if @workout.workout_drills.any?{|w| w.complete == false}
    else
      flash[:notice] = "All done! Congratulations!"
      redirect_to dashboard_player_path
    end
  end

  def update
    @workout_drill = WorkoutDrill.find(params[:id])
    @workout_drill.update_attributes(workout_drill_params)
    redirect_to workout_drill_path
  end

  private

  def workout_drill_params
    params.require(:workout_drill).permit(:workout_id, :drill_id, :complete)
  end

end