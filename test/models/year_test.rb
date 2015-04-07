require 'test_helper'

class YearTest < ActiveSupport::TestCase
  def setup
    @plan = FactoryGirl.create :course_plan, student_id: 12, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @plan.id
  end

  test "year invalid without a course plan" do
    year = Year.new
    assert !year.valid?, "Year's course plan is not being validated"
  end

  test "year valid with course plan and year value" do
    year = @year
    assert year.valid?
  end

  test "should not save duplicate year for course plan id" do
    FactoryGirl.create :year, {course_plan_id: @plan.id, year: 2016}
    year2 = @plan.years.new
    year2.year = 2016
    assert !year2.valid?, "Saved a duplicate year for the same course plan id"
  end

  test "can save same year for two different plans" do
    year_plan1 = FactoryGirl.create :year, {course_plan_id: @plan.id, year: 2016}
    new_plan = FactoryGirl.create :course_plan, student_id: 13, plan_name: "Plan 2"
    year_plan2 = FactoryGirl.create :year, {course_plan_id: new_plan.id, year: 2016}

    assert year_plan2.valid?, "Cannot create year object with same year value for second course plan"
    assert_equal year_plan2.year, 2016, "Year created with incorrect value"
    assert_equal year_plan1.year, 2016, "Year value was changed erroneously"
  end

  test "should autogenerate spring, summer, and fall semester relations" do
    assert @year.semesters.length === 3
    semesters = ['Spring','Summer','Fall']
    @year.semesters.each_with_index do |semester, i|
      assert semester.name === semesters[i]
    end
  end

  test "should destroy dependent semesters for a destroyed year" do
    assert_difference('Semester.count', -3) do
      Year.destroy(@year.id)
    end
  end
end
