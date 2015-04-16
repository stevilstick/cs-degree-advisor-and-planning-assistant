require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  def setup
    @controller = CoursesController.new
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    FactoryGirl.create :course, name: "Algebra", subject: "MTH", call_number: 101, credit_hours: 3, description: "Description"
    FactoryGirl.create :course, name: "Baroque Art History", subject: "ARTH", call_number: 4010, credit_hours: 4, description: "Description"
    FactoryGirl.create :course, name: "Principles of Algorithms", subject: "CS", call_number: 4050, credit_hours: 4, description: "Description"
    FactoryGirl.create :course, name: "Roman Architecture", subject: "ARTH", call_number: 3050, credit_hours: 3, description: "Description"
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

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { name: "computer science 1", subject: "CS", call_number: 1050, credit_hours: 4, description: "this is a description" }
    end
    assert_redirected_to course_path(assigns(:course))
  end

  test "should get index" do
    get :index, semester_id: @semester.id
    assert_response :success
    assert_template :index
    assert_not_nil assigns(:courses)
  end

  test "index should get all" do
    get :index, semester_id: @semester.id
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Principles of Algorithms"
    assert_select "h2", "Baroque Art History"
  end

  test "index gets some with fuzzy search by name" do
    get :index, { semester_id: @semester.id, query_param: "Course Name (ex. Computer Science)", search: "algo" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Principles of Algorithms"
  end

  test "index gets some with fuzzy search by course listing" do
    get :index, { semester_id: @semester.id, query_param: "Course Listing (ex. CS 1050)", search: "MTH 4010" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Baroque Art History"
  end

  test "index gets some with fuzzy search by subject" do
    get :index, { semester_id: @semester.id, query_param: "Subject (ex. CS, MTH, PHYS)", search: "MTH" }
    assert_select "h2", "Algebra"
    assert_select "h2", "Roman Architecture"
    assert_select "h2", "Baroque Art History"
  end
end
