require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  def setup
    @plan = FactoryGirl.create :course_plan, student_id: 12
    @year = FactoryGirl.create :year, course_plan_id: @plan.id
    @semester = FactoryGirl.create :semester, year_id: @year.id
    @course_instance = FactoryGirl.create :course_instance, @semester.id
  end

  test "should be invalid without an associated year" do
    assert_not Semester.new.valid?
  end

  test "should be valid with a valid year" do
    assert Semester.new(year: Year.find_by(1))
  end

  test "should destroy dependent course instances for a destroyed semester" do
    assert_difference('CourseInstance.count', -1) do
      Semester.destroy(@semester.id)
    end
  end
end
