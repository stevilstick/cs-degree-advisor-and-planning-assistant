require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  setup do
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
  end

  test "should create semester" do


    assert_difference('Semester.count') do
      post :create, semester: {name: 'Fall', year_id: @year.id}
    end

    assert_redirected_to course_plan_path(@course_plan.id)
  end

end
