class WorkoutDrillsController < ApplicationController

  def index
    @workout_drills = current_user.workout_drills.all
  end

  def create
  end

  def show
     @workout_drill = WorkoutDrill.find(params[:id])
  end

  def update
    @workout_drill = WorkoutDrill.find(params[:id])
    @workout_drill.update_attributes(workout_drill_params)
    next_drill = @workout_drill.next_drill
    if current_workout.workout_drills.any?{|w| w.complete == false}
      redirect_to workout_drill_path(next_drill)
    else
      flash[:notice] = "All done! Congratulations!"
      redirect_to dashboard_player_path
    end

  end

  private
  helper_method :current_workout

  def current_workout
    current_user.workouts.last
  end
  
  def workout_drill_params
    params.require(:workout_drill).permit(:workout_id, :drill_id, :complete, :rating)
  end


end