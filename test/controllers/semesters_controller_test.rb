require 'test_helper'

class SemestersControllerTest < ActionController::TestCase
  setup do
    @semester = semesters(:one)
  end

  test "should create semester" do


    assert_difference('Semester.count') do
      post :create, semester: {name: 'Fall', year_id: 1}
    end

    assert_redirected_to course_plan_path(1)
  end

  test "should not create a semester" do
    3.times do
      post :create, semester: {name: 'Test', year_id: 1}
    end

    post :create, semester: {name:'Fall', year_id: 1}
    assert_response :unprocessable_entity
  end

end
