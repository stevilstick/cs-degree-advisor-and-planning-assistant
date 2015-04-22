class CourseInstancesController < ApplicationController
  before_action :set_course_instance, only: [:destroy]

  # GET /course_instances/new
  def new
  	@course_instance = CourseInstance.new
  end

  # POST /course_instances
  # POST /course_instances.json
  def create
  	@course_instance = CourseInstance.new(course_instance_params)

    respond_to do |format|
      if @course_instance.save
        CourseInstanceService.updatePrerequisites({course_plan_id:@course_instance.semester.year.course_plan.id})
        format.html { redirect_to course_plan_path( @course_instance.semester.year.course_plan), notice: 'Course instance was successfully created.' }
        format.json { render :show, status: :created, location: @course_instance }
      else
        format.html { redirect_to course_plan_path( @course_instance.semester.year.course_plan), status: :unprocessable_entity }
        format.json { render json: @course_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_instances/1
  # DELETE /course_instances/1.json
  def destroy
    course_plan = @course_instance.semester.year.course_plan
    @course_instance.destroy
    respond_to do |format|
      format.html { redirect_to course_plan_path(course_plan),
                                course_instance_notice: 'Course was successfully deleted.' }
      format.json { head :no_content }
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_instance
      @course_instance = CourseInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_instance_params
      params.require(:course_instance).permit(:course_id, :semester_id)
    end
end
