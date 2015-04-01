class YearsController < ApplicationController
  #before_filter :get_course_plan

  def create
    @course_plan = CoursePlan.find(params[:course_plan_id])
    @year = @course_plan.years.new(year_params)
    @year.save

    respond_to do |format|
      format.html { render :nothing => :true }
      format.js
    end
  end

  def destroy
    @year = Year.find(params[:id])
    @year.destroy

    respond_to do |format|
      format.html { render :nothing => :true }
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
