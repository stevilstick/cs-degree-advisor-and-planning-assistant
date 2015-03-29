require 'test_helper'

class CoursePlanTest < ActiveSupport::TestCase
  def setup
    @plan = CoursePlan.new(student_id: 12)
  end

  test "should be valid" do
    assert @plan.valid?
  end

  test "student id should be present" do
    @plan.student_id = "        "
    assert_not @plan.valid?

    @plan.student_id = ""
    assert_not @plan.valid?
  end

end
