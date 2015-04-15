require 'test_helper'

class ApiV1SemestersTest < ActionDispatch::IntegrationTest

  setup do
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
  end

  test "creates a semester" do
    post "/api/v1/semesters/", { year_id: @year.id, name: "Craymester" }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_equal(@year.id, body['semester']['year_id'])
  end

  test "should update a semester" do
    semester = FactoryGirl.create :semester, year_id: 1, name: "Week 42"
    put "/api/v1/semesters/#{semester['id']}", { name: "Funkytown" }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal("Funkytown", body['semester']['name'])
  end

  test "should return 404 when updating a missing semester" do
    put "/api/v1/semesters/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single semester" do
    semester = FactoryGirl.create :semester, year_id: 1, name: "Final Semester"
    get "/api/v1/semesters/#{semester['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal(200, response.status, "has successful response code")
    assert_equal("Final Semester", body['semester']['name'], "Has the correct name")
    assert_not_nil(body['semester']['id'])
    assert_not_nil(body['semester']['created_at'])
    assert_not_nil(body['semester']['year_id'])
    assert_nil(body['semesters'])
  end

  test "should return all the semesters" do
    @year1 = FactoryGirl.create :year, year: 2015, course_plan_id: @course_plan.id
    @year2 = FactoryGirl.create :year, year: 1993, course_plan_id: @course_plan.id
    @year3 = FactoryGirl.create :year, year: 3030, course_plan_id: @course_plan.id
    FactoryGirl.create :semester, year_id: @year2.id, name: "Semester 1"
    FactoryGirl.create :semester, year_id: @year1.id, name: "Semester 2"
    FactoryGirl.create :semester, year_id: @year3.id, name: "Semester 3"
    get "/api/v1/semesters", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    assert(body['semesters'].length >= 3, "Length of return is at least 3")
    assert_not_nil(body['semesters'].first['id'])
    assert_not_nil(body['semesters'].first['created_at'])
    assert_not_nil(body['semesters'].first['name'])
  end

  test "should return 404 when retrieving a missing semester" do
    get "/api/v1/semesters/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should delete a semester" do
    semester1 = FactoryGirl.create :semester, year_id: @year.id, name: "Semester 7"
    delete "/api/v1/semesters/#{semester1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/semesters/#{semester1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing semester" do
    delete "/api/v1/semesters/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
