class YearsController < ApplicationController
  before_filter :get_course_plan

  def create
    @year = @course_plan.years.new(year_params)
    @year.save

    respond_to do |format|
      format.html { redirect_to @course_plan }
      format.js
    end
  end

  def get_course_plan
    @course_plan = CoursePlan.find(params[:course_plan_id])
  end

  private

    def year_params
      params.require(:year).permit(:course_plan_id, :year)
    end
end
