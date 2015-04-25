class PrerequisitesController < ApplicationController
  
  def new
    @course = Course.find(params[:course])
    @prerequisite = Prerequisite.new
  end
  
  def create
    @prerequisite = Prerequisite.new(prerequisite_params)
    if @prerequisite.save
      redirect_to course_path(@prerequisite.this_course_id)
    else
      render 'new'
    end
  end

  def destroy
    @prerequisite = Prerequisite.where({target_course_id: params[:target_course_id], this_course_id: params[:this_course_id]})
    course = Course.find(@prerequisite.first.this_course_id)
    @prerequisite.first.destroy
    respond_to do |format|
      format.html { redirect_to course_path(course),
                                prerequisite_notice: 'Prerequisite was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def prerequisite_params
      params.require(:prerequisite).permit(:this_course_id, :target_course_id)
    end
end
