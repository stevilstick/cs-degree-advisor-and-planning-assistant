require 'test_helper'

class CourseInstanceTest < ActiveSupport::TestCase

  def setup
    @plan = FactoryGirl.create :course_plan, student_id: 12, plan_name: "test plan"
    @year = FactoryGirl.create :year, course_plan_id: @plan.id
    @winterim = FactoryGirl.create :semester_definition, name: "Winterim"
    @semester = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: @winterim.id
    @course_instance = FactoryGirl.create :course_instance, semester_id: @semester.id, course_id:1
  end

  test "should not save duplicate course for semester" do
    course_instance2 = @semester.course_instances.new
    course_instance2.course_id = 1
    assert !course_instance2.valid?, "Saved an existing course in the same semester"
  end

  test "can save same course instances for two different semesters" do
    spring = FactoryGirl.create :semester_definition, name: "Spring"
    semester1 = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: spring.id
    course_instance3 = semester1.course_instances.new
    course_instance3.course_id = 1
    assert course_instance3.valid?, "Should save, course not in semester1"
  end
end
