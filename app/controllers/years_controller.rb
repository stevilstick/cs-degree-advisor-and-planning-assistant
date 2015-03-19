class YearsController < ApplicationController
  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    @year.course_plan_id = :course_plan.id

    respond_to do |format|
      format.html
      format.js
    end

    if @year.save
      redirect_to "course_plans#show"
    else
      render 'new'
    end
  end

  def show
    @year = Year.find(params[:id])
  end

  private

    def year_params
      params.require(:year).permit(:year, :course_plan)
    end
end
