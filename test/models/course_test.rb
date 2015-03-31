require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = Course.new(name: "computer science 1", subject: "CS", call_number: 1050, credit_hours: 4, description: "this is a description")
  end

  test "should be valid" do
    assert @course.valid?
  end

  test "name should be present" do
    @course.name = "        "
    assert_not @course.valid?

    @course.name = ""
    assert_not @course.valid?
  end

test "subject should be present" do
    @course.subject = "        "
    assert_not @course.valid?

    @course.subject = ""
    assert_not @course.valid?
  end

test "call_number should be present" do
    @course.call_number = "        "
    assert_not @course.valid?

    @course.call_number = ""
    assert_not @course.valid?
  end

test "credit_hours should be present" do
    @course.credit_hours = "        "
    assert_not @course.valid?

    @course.credit_hours = ""
    assert_not @course.valid?
  end

test "description should be present" do
    @course.description = "        "
    assert_not @course.valid?

    @course.description = ""
    assert_not @course.valid?
  end

test "subject should not be too long" do
    @course.subject = "A" * 2
    assert @course.valid?

    @course.subject = "A" * 3
    assert_not @course.valid?
  end

test "call number should be integer only" do
    @course.call_number = 2
    assert @course.valid?

    @course.call_number = "a"
    assert_not @course.valid?
  end

test "credit hours should be integer only" do
    @course.credit_hours = 2
    assert @course.valid?

    @course.credit_hours = "a"
    assert_not @course.valid?
  end

end
