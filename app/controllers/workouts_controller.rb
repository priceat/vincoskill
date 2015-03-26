class WorkoutsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @workout = Workout.new
  end

  def create
    @new_workout = current_user.workouts.new
    if @new_workout.save
      redirect_to @new_workout
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    # @drills = @exercises.drills
  end
  
  private

  def workout_params
    params.require(:workout).permit(:title, :type)
  end

 
end
