class CoursesController < ApplicationController
  before_action :set_course_plan, only: [:show, :edit, :update, :destroy]

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
end
