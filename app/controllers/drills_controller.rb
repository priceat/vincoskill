class DrillsController < ApplicationController
  def index
    @drills = Drill.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @drill = Drill.new
  end

  def create
     @drill = Drill.create(drill_params)
    if @drill.valid?
      redirect_to dashboard_admin_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if current_drill.update_attributes(params.require(:drill).permit(:name, :description, :pointers, :video, :skill_level, :reps, :drill_pattern))
       flash[:notice] = "Drill updated."
       redirect_to current_drill
     else
       flash[:error] = "There was an error saving the drill. Please try again."
       render :edit
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
    params.require(:drill).permit(:name, :description, :pointers, :video, :skill_level, :reps, :drill_pattern)
  end
end
