class CoursesController < ApplicationController
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
    else
      render 'new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def index
    if params[:search]
      # Need TODO allow searching by different attributes find_by_fuzzy_attribute
      if params[:query_param]
        query_param = params[:query_param]
        if query_param.start_with? "Course Listing"
          @courses = Course.find_by_fuzzy_course_listing(params[:search], :limit => 10)
        elsif query_param.start_with? "Subject"
          @courses = Course.find_by_fuzzy_subject(params[:search], :limit => 10)
        else
          @courses = Course.find_by_fuzzy_name(params[:search], :limit => 10)
        end
      end
    elsif params[:show_all]
      @courses = Course.all.order('name ASC')
    else
      # TODO may want to paginate in the future in the default case
      @courses = Course.all.order('name ASC')
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_path(@course), notice: 'Course was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def course_params
      params.require(:course).permit(:name, :subject, :call_number, :credit_hours, :description)
    end
end
