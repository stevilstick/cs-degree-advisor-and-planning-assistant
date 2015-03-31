require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  def setup
    @course_plan = course_plans(:plan1)
  end

  test "should create year" do
    assert_difference('@course_plan.years.count') do
      post :create, year: {course_plan_id: @course_plan.id, year: 2017}, course_plan_id: @course_plan.id
    end
    assert_response :redirect
  end

  test "should destroy year" do
    assert_difference('Year.count', -1) do
      delete :destroy, id: 1
    end
    #assert_response :redirect
  end
end
