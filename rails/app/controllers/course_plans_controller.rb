class CoursePlansController < ApplicationController
  def new
    @course_plan = CoursePlan.new
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
    @course_plan = CoursePlan.find(params[:id])
  end

  private

    def plan_params
      params.require(:course_plan).permit(:student_id)
    end
end
