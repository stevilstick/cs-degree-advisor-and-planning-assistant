class CoursePlansController < ApplicationController
  before_action :set_course_plan, only: [:show, :edit, :update, :destroy]

  def new
    @course_plan = CoursePlan.new
  end
  
  def index
    @course_plans = CoursePlan.all
  end
  
  def create
    @course_plan = CoursePlan.new(plan_params)
    if @course_plan.save
      redirect_to @course_plan
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @course_plan.update(plan_params)
        format.html { redirect_to @course_plan, notice: 'Course Plan was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @course_plan.destroy
    respond_to do |format|
      format.html { render nothing: true }
    end
  end

  private

    def set_course_plan
      @course_plan = CoursePlan.find(params[:id])
    end
    
    def plan_params
      params.require(:course_plan).permit(:student_id)
    end
end
