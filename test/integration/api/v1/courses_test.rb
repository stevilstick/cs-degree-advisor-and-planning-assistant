require 'test_helper'

class ApiV1CoursesTest < ActionDispatch::IntegrationTest

  setup do
    @course = FactoryGirl.create :course, name: "Skydiving", subject: "x-treme", call_number: 777, credit_hours: 81, description: "Jumping out of planes"
  end

  test "creates a course" do
    post "/api/v1/courses/", { name: "Underwater Basket Weaving", description: "Aqua crafts", subject: "UW", call_number: 4210, credit_hours: 3 }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_equal("Underwater Basket Weaving", body['course']['name'])
    assert_equal("UW", body['course']['subject'])
    assert_equal(4210, body['course']['call_number'])
    assert_equal("Aqua crafts", body['course']['description'])
    assert_equal("3.0", body['course']['credit_hours'])
  end

  test "should update a course" do
    put "/api/v1/courses/#{@course.id}", { name: "Tomfoolery", subject: "PU", call_number: 600, description: "Horseplay", credit_hours: 77 }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal("Tomfoolery", body['course']['name'])
    assert_equal("Horseplay", body['course']['description'])
    assert_equal("77.0", body['course']['credit_hours'])
    assert_equal(600, body['course']['call_number'])
    assert_equal("PU", body['course']['subject'])
  end

  test "should return 404 when updating a missing course" do
    put "/api/v1/courses/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single course" do
    course = FactoryGirl.create :course, name: "Applied Lolligagging", subject: "x-treme", call_number: 777, 
      credit_hours: 81.0, description: "Jumping out of planes"
    get "/api/v1/courses/#{course['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal("Applied Lolligagging", body['course']['name'])
    assert_equal("Jumping out of planes", body['course']['description'])
    assert_equal("81.0", body['course']['credit_hours'])
    assert_equal(777, body['course']['call_number'])
    assert_equal("x-treme", body['course']['subject'])
    assert_equal(200, response.status, "has successful response code")
    assert_not_nil(body['course']['id'])
    assert_not_nil(body['course']['created_at'])
    assert_nil(body['courses'])
  end

  test "should return all the courses" do
    FactoryGirl.create :course, name: "a", description: "1.12", credit_hours: 88, call_number: 5, subject: "ahhh!!!!"
    FactoryGirl.create :course, name: "Do you feel lucky punk?", description: "Hamburgulars greatest hits", 
      credit_hours: 1.0, call_number: 88888888, subject: "Mickey Deeez"
    get "/api/v1/courses", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    assert(body['courses'].length >= 2, "Length of return is at least 3")
    assert_not_nil(body['courses'].first['id'])
    assert_not_nil(body['courses'].first['created_at'])
    assert_not_nil(body['courses'].first['name'])
    assert_not_nil(body['courses'].first['description'])
    assert_not_nil(body['courses'].first['credit_hours'])
    assert_not_nil(body['courses'].first['call_number'])
    assert_not_nil(body['courses'].first['subject'])
  end

  test "should return 404 when retrieving a missing course" do
    get "/api/v1/courses/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should delete a course" do
    course = FactoryGirl.create :course, name: "Applied Lolligagging", subject: "x-treme", call_number: 777
    delete "/api/v1/courses/#{course['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/courses/#{course['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing course" do
    delete "/api/v1/courses/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
