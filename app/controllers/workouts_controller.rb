class WorkoutsController < ApplicationController
  before_action :authenticate_user!
  def index
  end
  def new
    @workout = Workout.new
  end
  def create
    @workout = Workout.create(workout_params)
    if @workout.valid?
      redirect_to workout_path(@workout)
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
    @workout = Workout.find(params[:id])
  end
  
  private

  def workout_params
    params.require(:workout).permit(:title, :type)
  end
end
