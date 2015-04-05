class WorkoutDrillsController < ApplicationController
  before_action :set_workout_drill, only: [:show]

  def index
    @workout_drills = current_user.workout_drills.all
  end

  def create
  end

  def show 
    @workout = current_user.workouts.last
    @workout_drill = @workout.workout_drills.where(:complete => false).first
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

  def set_workout_drill
    @workout_drill = WorkoutDrill.find(params[:id])
  end

end