require 'test_helper'

class PrerequisitesControllerTest < ActionController::TestCase
  def setup
    @course1 = FactoryGirl.create :course, name: "Algebra", subject: "MTH", call_number: 101, credit_hours: 3, description: "Description"
    @course2 = FactoryGirl.create :course, name: "Baroque Art History", subject: "ARTH", call_number: 4010, credit_hours: 4, description: "Description"
    @prerequisite = FactoryGirl.create :prerequisite, this_course_id: @course1.id, target_course_id: @course2.id
  end

  test "should create prerequisite" do
    assert_difference('@course1.prerequisite.count') do
      post :create, prerequisite: {this_course_id: @course1.id}, target_course_id: @course2.id
    end
    assert_response :redirect
  end

  test "should destroy prerequisite" do
    assert_difference('Prerequisite.count', -1) do
      delete :destroy, id: @prerequisite.id
    end
  end
end
