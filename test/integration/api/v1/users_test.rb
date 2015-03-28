require 'test_helper'

class ApiV1UsersTest < ActionDispatch::IntegrationTest

  def setup
    @user = FactoryGirl.create :user, first_name: "Michelle", last_name: "Tanner", email: "yougotitdude@msudenver.edu"
  end

  test "should create a user" do
    post "/api/v1/users/", { first_name: "Mr.", last_name: "Pickles", email: "pickles@yahoo.com", password: "testing" }, { "Accept" => "application/json" }
    assert_equal(201, response.status)

    body = JSON.parse(response.body)
    assert_nil(body['user']['id'])
    assert_nil(body['user']['created_at'])
    assert_nil(body['user']['password'])
    assert_nil(body['user']['password_confirmation'])
    assert_equal("Mr.", body['user']['first_name'])
    assert_equal("Pickles", body['user']['last_name'])
    assert_equal("pickles@yahoo.com", body['user']['email'])
  end

  test "should update a user" do
    put "/api/v1/users/#{@user['id']}", { first_name: "Trevor", last_name: "Smith", email: "trevor@hi.com" }, { "Accept" => "application/json" }

    assert_equal(200, response.status)

    body = JSON.parse(response.body)
    assert_equal("Trevor", body['user']['first_name'])
    assert_equal("Smith", body['user']['last_name'])
    assert_equal("trevor@hi.com", body['user']['email'])
  end

  test "should return 404 when updating a missing user" do
    put "/api/v1/users/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return a single user" do
    get "/api/v1/users/#{@user['id']}", {}, { "Accept" => "application/json" }
    body = JSON.parse(response.body)

    assert_equal(200, response.status, "has successful response code")
    assert_equal("Michelle", body['user']['first_name'])
    assert_equal("Tanner", body['user']['last_name'])
    assert_equal("yougotitdude@msudenver.edu", body['user']['email'])
    assert_nil(body['user']['id'])
    assert_nil(body['user']['created_at'])
    assert_nil(body['users'])
  end

  test "should return 404 when retrieving a missing user" do
    get "/api/v1/users/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return all the users" do
    FactoryGirl.create :user
    FactoryGirl.create :user, first_name: "Dr.", last_name: "Jones", email: "youhavechosenwisely@msudenver.edu"
    FactoryGirl.create :user, first_name: "Chuckles", last_name: "O'Hoolihan", email: "howdyhoo@xyz.cbs"
    get "/api/v1/users", {}, { "Accept" => "application/json" }

    assert_equal(response.status, 200, "has successful response code")

    body = JSON.parse(response.body)
    users = body['users'].map { |m| m["first_name"] }
    assert_equal(["Chuckles", "Dr.", "Leroy", "Michelle"], users.sort)
    assert_equal(4, body['users'].length)
    assert_nil(body['users'].first['id'])
    assert_nil(body['users'].first['created_at'])
    assert_nil(body['users'].first['password'])
    assert_nil(body['users'].first['password_confirmation'])
  end

  test "should delete a user" do
    delete "/api/v1/users/#{@user['id']}", {}, { "Accept" => "application/json" }
    assert_equal(204, response.status)
    
    get "/api/v1/users/#{@user['id']}", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end

  test "should return 404 when deleteing a missing course plan" do
    delete "/api/v1/users/99", {}, { "Accept" => "application/json" }
    assert_equal(404, response.status)
  end
end
