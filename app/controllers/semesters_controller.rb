class SemestersController < ApplicationController
  before_action :set_semester, only: [:show, :edit, :update, :destroy, :add_courses]

  # GET /semesters
  # GET /semesters.json
  def index
    @semesters = Semester.all
  end

  # GET /semesters/1
  # GET /semesters/1.json
  def show
  end

  # GET /semesters/new
  def new
    @semester = Semester.new
  end

  # GET /semesters/1/edit
  def edit
  end

  # POST /semesters/1/add_courses
  def add_courses
    params[:course_ids] ||= []
    params.permit(:id, course_ids: [])
    courses_to_add = params[:course_ids]
    instances = []
    courses_to_add.each do |id|
      CourseInstance.new(course_id:id, semester_id:@semester.id).save
    end
    redirect_to course_plan_path(@semester.year.course_plan)
  end

  # POST /semesters
  # POST /semesters.json
  def create
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        format.html { redirect_to course_plan_path(@semester.year.course_plan) }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html do
          redirect_to course_plan_path(@semester.year.course_plan),
                      semester_notice:
                          "Semester cannot be created."
        end
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /semesters/1
  # PATCH/PUT /semesters/1.json
  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester.year.course_plan, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /semesters/1
  # DELETE /semesters/1.json
  def destroy
    course_plan = @semester.year.course_plan
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to course_plan_path(course_plan),
                                semester_notice: 'Semester was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_semester
      @semester = Semester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def semester_params
      params.require(:semester).permit(:semester_definition_id, :year_id)
    end
end
