class DrillsController < ApplicationController
  def index
    @drills = Drill.all
  end

  def new
    @drill = Drill.new
  end

  def create
     @drill = Drill.create(drill_params)
    if @drill.valid?
      redirect_to drills_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def show
  end

  private

  helper_method :current_drill
  def current_drill
    @current_drill ||= Drill.find(params[:id])
  end

  def drill_params
    params.require(:drill).permit(:name, :description, :pointers, :video)
  end
end
