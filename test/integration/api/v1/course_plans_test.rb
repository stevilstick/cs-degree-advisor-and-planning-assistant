require 'test_helper'

class ApiV1CoursePlansTest < ActionDispatch::IntegrationTest

  def setup
    CoursePlan.delete_all
  end

  test "creates a course plan" do
    post "/api/v1/course_plans/", { student_id: 33, plan_name: "First" }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_equal(33, body['course_plan']['student_id'])
  end

  test "should update a course plan" do
    plan = FactoryGirl.create :course_plan, student_id: 3, plan_name: "Plan 1"
    put "/api/v1/course_plans/#{plan['id']}", { student_id: 4 }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal(4, body['course_plan']['student_id'])
  end

  test "should return 404 when updating a missing course plan" do
    put "/api/v1/course_plans/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single course plan" do
    plan = FactoryGirl.create :course_plan, student_id: 3, plan_name: "Plan 1"
    get "/api/v1/course_plans/#{plan['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal(200, response.status, "has successful response code")
    assert_equal(3, body['course_plan']['student_id'], "has the right student_id")
    assert_not_nil(body['course_plan']['id'])
    assert_not_nil(body['course_plan']['created_at'])
    assert_nil(body['course_plans'])
  end

  test "should return all the course plans" do
    FactoryGirl.create :course_plan, student_id: 3, plan_name: "Plan 1"
    FactoryGirl.create :course_plan, student_id: 7, plan_name: "Plan 2"
    FactoryGirl.create :course_plan, student_id: 9, plan_name: "Plan 3"
    get "/api/v1/course_plans", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    course_plans = body['course_plans'].map { |m| m["student_id"] }.compact
    assert_equal([3, 7, 9], course_plans.sort)
    assert_equal(3, course_plans.length)
    assert_not_nil(body['course_plans'].first['id'])
    assert_not_nil(body['course_plans'].first['created_at'])
  end

  test "should return 404 when retrieving a missing course plan" do
    get "/api/v1/course_plans/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should delete a course plan" do
    plan1 = FactoryGirl.create :course_plan, student_id: 3, plan_name: "Plan 1"
    delete "/api/v1/course_plans/#{plan1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/course_plans/#{plan1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing course plan" do
    delete "/api/v1/course_plans/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
