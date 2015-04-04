require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  def setup
    @controller = CoursesController.new
    FactoryGirl.create :course, name: "Algebra", crn: 80506, subject: "MTH", call_number: 101, credit_hours: 3
    FactoryGirl.create :course, name: "Baroque Art History", crn: 123456, subject: "ARTH", call_number: 4010, credit_hours: 4
    FactoryGirl.create :course, name: "Principles of Algorithms", crn: 98687, subject: "CS", call_number: 4050, credit_hours: 4
    FactoryGirl.create :course, name: "Roman Architecture", crn: 98675, subject: "ARTH", call_number: 3050, credit_hours: 3
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:courses)
  end

  test "index should get all" do
    get :index
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Principles of Algorithms"
    assert_select "h2", "Baroque Art History"
  end

  test "index gets some with fuzzy search by name" do
    get :index, { query_param: "Course Name (ex. Computer Science)", search: "algo" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Principles of Algorithms"
  end

  test "index gets some with fuzzy search by course listing" do
    get :index, { query_param: "Course Listing (ex. CS 1050)", search: "MTH 4010" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Baroque Art History"
  end

  test "index gets some with fuzzy search by subject" do
    get :index, { query_param: "Subject (ex. CS, MTH, PHYS)", search: "MTH" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Baroque Art History"
  end

  test "index gets one with search by crn" do
    get :index, { query_param: "CRN Number (ex. 801176)", search: "123456" }
    assert_select "h2", "Baroque Art History"
  end
end
