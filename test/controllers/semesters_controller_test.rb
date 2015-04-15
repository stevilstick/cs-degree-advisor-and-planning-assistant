require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  setup do
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id, name: 'Fall'
  end

  test "should create semester" do


    assert_difference('Semester.count') do
      post :create, semester: {name: 'Fall', year_id: @year.id}
    end

    assert_redirected_to course_plan_path(@course_plan.id)
  end

  test "should not create a semester without a name" do
    assert_no_difference('Semester.count') do
      post :create, semester: {name: '', year_id: @year.id}
    end

    assert_redirected_to course_plan_path(@course_plan.id)

  end

  test "should delete a semester" do
    assert_difference 'Semester.count', -1 do
      delete :destroy, id: @semester
    end

    assert_redirected_to course_plan_path(@course_plan.id)
  end

  test "should update semester name" do
    put :update, id: @semester.id, semester: {name: 'Spring'}
    assert_equal 'Spring', assigns(:semester).name
  end

end
