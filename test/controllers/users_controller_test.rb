require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @controller = UsersController.new
  end

  test "should get new" do
    get :new
    assert_response :success
  end

end
