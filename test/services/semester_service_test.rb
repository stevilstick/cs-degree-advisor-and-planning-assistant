require 'test_helper'

class SemesterServicesTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @fall = FactoryGirl.create :semester_definition, name: "Fall", id: 5, in_year_position:3
    @spring = FactoryGirl.create :semester_definition, name: "Spring", id:2, in_year_position:1
    @summer = FactoryGirl.create :semester_definition, name: "Summer", id:4, in_year_position:2
  end

  # There will be a total of three course instances, 2 of are in previous semesters
  test "should find course instances with in semesters previous to semester_id = 5(Fall def), and year_id=1" do
    semester = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: @fall.id
    context = {semester_id:semester.id} #@semester has fall as definition
    result = SemesterService.find_past_semesters(context)
    assert result.length == 2, "Only " + result.length.to_s + " course instances found"
  end

end