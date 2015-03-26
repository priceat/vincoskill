class Workouts::ExercisesController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update]

  def show
    @exercise = Exercise.find(params[:id])
    @drill = @exercise.drills
  end

  def next_drill
    @workout = Workout.find(params[:workout_id])
  end

  private

  def set_workout
    @workout = Workout.find(params[:workout_id])
  end

end
