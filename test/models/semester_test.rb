require 'test_helper'

class SemesterTest < ActiveSupport::TestCase
  test "should be invalid without an associated year" do
    assert_not Semester.new.valid?
  end

  test "should be valid with a valid year" do
    assert Semester.new(year: Year.find_by(1))
  end

  test "should not save without a name" do
    assert_not Semester.new.save
  end
end
