class PrerequisitesController < ApplicationController
  
  def new
    @prerequisite = Prerequisite.new
  end
  
  def create
    @prerequisite = Prerequisite.new(prerequisite_params)
    if @prerequisite.save
      redirect_to course_path(@prerequisite.course)
    else
      render 'new'
    end
  end

  def show
    @prerequisite = Prerequisite.find(params[:id])
  end

  def destroy
    course = @prerequisite.course
    @prerequisite.destroy
    respond_to do |format|
      format.html { redirect_to course_path(course),
                                prerequisite_notice: 'Prerequisite was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def prerequisite_params
      params.require(:prerequisite).permit(:course_id)
    end
end
