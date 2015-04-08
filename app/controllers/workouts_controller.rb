class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workouts = Workout.all
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = current_user.workouts.create
    if @workout.save
      redirect_to @workout
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @workout = current_user.workouts.find(params[:id])
    @workout_drill = current_workout.workout_drills.first
  end
  
  def completed
 
  end

  private

  helper_method :current_workout

  def workout_params
    params.require(:workout).permit(:title, :type)
  end

  def current_workout
    @current_workout ||= Workout.find(params[:id])
  end
 
end
