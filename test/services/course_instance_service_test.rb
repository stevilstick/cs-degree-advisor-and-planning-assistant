require 'test_helper'
class CourseInstancesServicesTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    @course_instance = FactoryGirl.create :course_instance, semester_id: @semester.id
  end

  test "should find course instance with semester_id equal to 1" do
    context = {semester_id:@semester.id}
    result = CourseInstanceService.new.find(context)
    assert result.new.get_semester_id == context[:semester_id]
  end

  # changed from fixtures to factory, there is only one course instance at the moment.
  test "should find one course instance with semester_id equal to 1" do
    context = {semester_id:@semester.id}
    result = CourseInstanceService.new.find(context)
    assert result.length == 1,"Only " + result.length.to_s + " course instances found"
  end

  # There is one semester, which contains one course instance
  test "should find one course instance with year_id equal to 1" do
    context = {year_id:@year.id}
    result = CourseInstanceService.new.find_by_year(context)
    assert result.length == 1, "Only " + result.length.to_s + " course instances found"
  end
  
end