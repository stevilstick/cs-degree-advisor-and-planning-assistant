require 'test_helper'

class YearsControllerTest < ActionController::TestCase
  def setup
    @course_plan = course_plans(:plan1)
  end

  test "should get new" do
    get :new, course_plan_id: 1
    assert_response :success
    assert_template :new
  end

  test "should get show" do
    get(:show, { course_plan_id: 1 })
    assert_response :success
    assert_template :show
  end

  test "should create year" do
    post :create, year: { course_plan_id: 2 }
    assert_response :success
    assert_template :create
  end
end
