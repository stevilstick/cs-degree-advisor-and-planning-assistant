require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  def setup
    @plan1 = FactoryGirl.create :course_plan, student_id: 3
  end

  test "should create year" do
    assert_difference('@plan1.years.count') do
      post :create, year: {course_plan_id: @plan1.id, year: 2017}, course_plan_id: @plan1.id
    end
    assert_response :redirect
  end

  test "should destroy year" do
    @year = FactoryGirl.create :year, {course_plan_id: @plan1.id, year: 2020}
    assert_difference('Year.count', -1) do
      delete :destroy, id: @year.id
    end
  end
end
