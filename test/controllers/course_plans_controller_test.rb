require 'test_helper'

class CoursePlansControllerTest < ActionController::TestCase
  def setup
    @controller = CoursePlansController.new
    FactoryGirl.create :course_plan, student_id: 1
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template :new
  end

  test "should get show" do
    get(:show, { id: 1 }) 
    assert_response :success
    assert_template :show
  end

  test "should create course plan" do
    assert_difference('CoursePlan.count') do
      post :create, course_plan: { student_id: 2 }
    end
    assert_redirected_to course_plan_path(assigns(:course_plan))
  end
end
