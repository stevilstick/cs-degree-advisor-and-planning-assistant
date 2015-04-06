require 'test_helper'

class CoursePlanTest < ActiveSupport::TestCase
  def setup
    @plan = CoursePlan.new(student_id: 12, plan_name: "Plan 1")
    @plan.save
    @plan.years << Year.new(year: 2000) << Year.new(year: 1995) << Year.new(year: 2050)
  end

  test "should be valid" do
    assert @plan.valid?
  end

  test "course plan name should be present" do
    @plan.plan_name = nil
    assert_not @plan.valid?
  end

  test "years should be ordered chronologically" do
      years = [1995, 2000, 2050]
      @plan.years.each_with_index do |year, i|
        assert year.year === years[i]
      end
  end

  test "should destroy dependent years for a destroyed course plan" do
    assert_difference('Year.count', -3) do
      CoursePlan.destroy(@plan.id)
    end
  end
end
