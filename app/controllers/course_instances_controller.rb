class CourseInstancesController < ApplicationController
  
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
        format.html { redirect_to course_plan_path( @course_instance.semester.year.course_plan), notice: 'Course instance was successfully created.' }
        format.json { render :show, status: :created, location: @course_instance }
      else
        format.html { redirect_to course_plan_path( @course_instance.semester.year.course_plan), status: :unprocessable_entity }
        format.json { render json: @course_instance.errors, status: :unprocessable_entity }
      end
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
