class YearsController < ApplicationController

  def new
    @year = Year.new
  end

  def show
  end

  def create
    @year = Year.new(year_params)

    respond_to do |format|
      if @year.save
        format.html { redirect_to course_plan_path(@year.course_plan), notice: 'Semester was successfully created.' }
        format.json { render :show, status: :created, location: @year }
      else
        format.html { redirect_to course_plan_path(@year.course_plan), status: :unprocessable_entity }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @year = Year.find(params[:id])
    @year.destroy
    respond_to do |format|
      format.html { redirect_to course_plan_path(@year.course_plan), notice: 'Year was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def year_params
      params.require(:year).permit(:course_plan_id, :year)
    end
end
