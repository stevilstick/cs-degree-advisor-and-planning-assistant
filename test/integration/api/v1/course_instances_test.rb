require 'test_helper'

class ApiV1CourseInstancesTest < ActionDispatch::IntegrationTest

  test "creates a course instance" do
    post "/api/v1/course_instances/", { course_id: 100, semester_id: 1, student_id: 2, rotation_id: 3 }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_equal(100, body['course_instance']['course_id'])
    assert_equal(1, body['course_instance']['semester_id'])
    assert_equal(2, body['course_instance']['student_id'])
    assert_equal(3, body['course_instance']['rotation_id'])
    assert_not_nil(body['course_instance']['id'])
    assert_not_nil(body['course_instance']['created_at'])
  end

  test "should update a course instance" do
    instance = FactoryGirl.create :course_instance, course_id: 5, semester_id: 1, student_id: 2, rotation_id: 3
    put "/api/v1/course_instances/#{instance['id']}", { course_id: 100 }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal(100, body['course_instance']['course_id'])
  end

  test "should return 404 when updating a missing course instance" do
    put "/api/v1/course_instances/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single course instance" do
    instance = FactoryGirl.create :course_instance, course_id: 5, semester_id: 1, student_id: 2, rotation_id: 3
    get "/api/v1/course_instances/#{instance['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal(200, response.status, "has successful response code")
    assert_equal(5, body['course_instance']['course_id'], "has the right course_id")
    assert_not_nil(body['course_instance']['id'])
    assert_not_nil(body['course_instance']['created_at'])
    assert_nil(body['course_instances'])
  end

  test "should return all the course instances" do
    FactoryGirl.create :course_instance, course_id: 5, semester_id: 2, student_id: 10, rotation_id: 5
    FactoryGirl.create :course_instance, course_id: 7, semester_id: 2, student_id: 8, rotation_id: 7
    FactoryGirl.create :course_instance, course_id: 9, semester_id: 2, student_id: 80, rotation_id: 3
    get "/api/v1/course_instances", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    course_instances = body['course_instances'].map { |m| m["course_id"] }
    assert_equal([5, 7, 9], course_instances.sort)
    assert_equal(3, body['course_instances'].length)
    course_instances = body['course_instances'].map { |m| m["semester_id"] }
    assert_equal([2, 2, 2], course_instances.sort)
    assert_equal(3, body['course_instances'].length)
    course_instances = body['course_instances'].map { |m| m["student_id"] }
    assert_equal([8, 10, 80], course_instances.sort)
    course_instances = body['course_instances'].map { |m| m["rotation_id"] }
    assert_equal([3, 5, 7], course_instances.sort)
    assert_equal(3, body['course_instances'].length)
    assert_not_nil(body['course_instances'].first['id'])
    assert_not_nil(body['course_instances'].first['created_at'])
  end

  test "should return 404 when retrieving a missing course instance" do
    get "/api/v1/course_instances/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should delete a course instance" do
    instance1 = FactoryGirl.create :course_instance, course_id: 5, semester_id: 2, student_id: 4, rotation_id: 1
    delete "/api/v1/course_instances/#{instance1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/course_instances/#{instance1['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing course instance" do
    delete "/api/v1/course_instances/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
