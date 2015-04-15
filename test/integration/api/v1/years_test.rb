require 'test_helper'

class ApiV1YearsTest < ActionDispatch::IntegrationTest

  setup do
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
  end

  test "creates a year" do
    post "/api/v1/years/", { year: 3030, course_plan_id: @course_plan.id }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_equal(@course_plan.id, body['year']['course_plan_id'])
    assert_equal(3030, body['year']['year'])
  end

  test "should update a year" do
    year = FactoryGirl.create :year, course_plan_id: @course_plan.id, year: 1492
    put "/api/v1/years/#{year['id']}", { year: 1969 }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal(1969, body['year']['year'])
  end

  test "should return 404 when updating a missing year" do
    put "/api/v1/years/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single year" do
    year = FactoryGirl.create :year, course_plan_id: @course_plan.id, year: 1492
    get "/api/v1/years/#{year['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal(200, response.status, "has successful response code")
    assert_equal(1492, body['year']['year'], "Has the correct year")
    assert_equal(@course_plan.id, body['year']['course_plan_id'])
    assert_not_nil(body['year']['id'])
    assert_not_nil(body['year']['created_at'])
    assert_nil(body['years'])
  end

  test "should return all the years" do
    @year1 = FactoryGirl.create :year, year: 2015, course_plan_id: @course_plan.id
    @year2 = FactoryGirl.create :year, year: 1993, course_plan_id: @course_plan.id
    @year3 = FactoryGirl.create :year, year: 3030, course_plan_id: @course_plan.id
    get "/api/v1/years", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    assert(body['years'].length >= 3, "Length of return is at least 3")
    assert_not_nil(body['years'].first['id'])
    assert_not_nil(body['years'].first['created_at'])
    assert_not_nil(body['years'].first['year'])
    assert_not_nil(body['years'].first['course_plan_id'])
  end

  test "should return 404 when retrieving a missing year" do
    get "/api/v1/years/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should delete a year" do
    year1 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year: 1947
    delete "/api/v1/years/#{year1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/years/#{year1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing year" do
    delete "/api/v1/years/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
