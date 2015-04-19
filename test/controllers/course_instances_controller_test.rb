require 'test_helper'

class CourseInstancesControllerTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    @course_instance = FactoryGirl.create :course_instance, semester_id: @semester.id
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  # Will need to add verification tests for duplicate courses
  test "should create course instance" do
    assert_difference('@semester.course_instances.count', 1) do
      post :create, course_instance: {semester_id: @semester.id, course_id: 2}
    end
    assert_response :redirect
  end

  test "should delete a course instance" do
    assert_difference('@semester.course_instances.count', -1) do
      delete :destroy, id: @course_instance
    end
    assert_redirected_to course_plan_path(@course_plan)
  end
end
