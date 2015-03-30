require 'test_helper'

class YearTest < ActiveSupport::TestCase
  def setup
    @plan = CoursePlan.new(student_id: 12)
    @plan.save
    @year = @plan.years.create([year: 2015])
  end

  test "year invalid without a course plan" do
    year = Year.new
    assert !year.valid?, "Year's course plan is not being validated"
  end

  test "year valid with course plan and year value" do
    year = years(:one)
    assert year.valid?
  end

  test "should not save duplicate year for course plan id" do
    year1 = years(:one)
    year2 = @plan.years.new
    year2.year = 2015
    assert !year2.valid?, "Saved a duplicate year for the same course plan id"
  end

  test "can save same year for two different plans" do
    old_plan = course_plans(:plan1)
    year_plan1 = years(:one)
    new_plan = CoursePlan.new(student_id: 3)
    new_plan.save
    year_plan2 = new_plan.years.new
    year_plan2.year = 2015

    assert year_plan2.valid?, "Cannot create year object with same year value for second course plan"
    assert_equal year_plan2.year, 2015, "Year created with incorrect value"
    assert_equal year_plan1.year, 2015, "Year value was changed erroneously"
  end
end
