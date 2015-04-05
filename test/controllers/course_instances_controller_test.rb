require 'test_helper'

class CourseInstancesControllerTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  # Will need to add verification tests for duplicate courses
  test "should create course instance" do
    assert_difference('@semester.course_instances.count') do
      post :create, course_instance: {semester_id: @semester.id, course: 1}, semester_id: @semester.id
    end
    assert_response :redirect
  end
end
