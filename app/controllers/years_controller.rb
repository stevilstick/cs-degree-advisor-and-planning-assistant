class YearsController < ApplicationController
  before_filter :get_course_plan

  def index
    @years = @course_plan.years
  end

  def new
    @year = @course_plan.year.new
  end

  def create
    @year = @course_plan.year.new(year_params)
    @year.save

    respond_to do |format|
      format.html { redirect_to 'course_plans#show' }
      format.js
    end
  end

  def get_course_plan
    @course_plan = CoursePlan.find(params[:course_plan_id])
  end

  def show
    @year = @course_plan.years.find(params[:id])
  end

  private

    def year_params
      params.require(:year).permit(:course_plan_id, :year)
    end
end
