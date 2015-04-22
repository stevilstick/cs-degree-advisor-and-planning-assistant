require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  def setup
    @controller = CoursesController.new
    
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    @course1 = FactoryGirl.create :course, name: "Algebra", subject: "MTH", call_number: 101, credit_hours: 3, description: "Description"
    @course2 = FactoryGirl.create :course, name: "Baroque Art History", subject: "ARTH", call_number: 4010, credit_hours: 4, description: "Description"
    @course3 = FactoryGirl.create :course, name: "Principles of Algorithms", subject: "CS", call_number: 4050, credit_hours: 4, description: "Description"
    @course4 = FactoryGirl.create :course, name: "Roman Architecture", subject: "ARTH", call_number: 3050, credit_hours: 3, description: "Description"
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
    assert_select "td", "Algebra"
    assert_select "td", "Roman Architecture"
    assert_select "td", "Principles of Algorithms"
    assert_select "td", "Baroque Art History"
  end

  test "index gets some with fuzzy search by name" do
    get :index, { semester_id: @semester.id, query_param: "Course Name (ex. Computer Science)", search: "algo" }
    assert_select "td", "Algebra"
    assert_select "td", "Principles of Algorithms"
  end

  test "index gets some with fuzzy search by course listing" do
    get :index, { semester_id: @semester.id, query_param: "Course Listing (ex. CS 1050)", search: "MTH 4010" }
    assert_select "td", "Algebra"
    assert_select "td", "Roman Architecture"
    assert_select "td", "Baroque Art History"
  end

  test "index gets some with fuzzy search by subject" do
    get :index, { semester_id: @semester.id, query_param: "Subject (ex. CS, MTH, PHYS)", search: "MTH" }
    assert_select "td", "Algebra"
    assert_select "td", "Roman Architecture"
    assert_select "td", "Baroque Art History"
  end

  test "should update course name" do
    put :update, id: @course1.id, course: {name: "College Algebra"}
    assert_equal "College Algebra", assigns(:course).name
  end

  test "should update course subject" do
    put :update, id: @course1.id, course: {subject: "CS"}
    assert_equal "CS", assigns(:course).subject
  end

  test "should update course call_number" do
    put :update, id: @course1.id, course: {call_number: 1050}
    assert_equal 1050, assigns(:course).call_number
  end

  test "should update course credit_hours" do
    put :update, id: @course1.id, course: {credit_hours: 3}
    assert_equal 3, assigns(:course).credit_hours
  end

  test "should update course description" do
    put :update, id: @course1.id, course: {description: "this is not a description."}
    assert_equal "this is not a description.", assigns(:course).description
  end
end
