require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  def setup
    @algebra = FactoryGirl.create :course, name: "Algebra", subject: "MTH", call_number: 101, credit_hours: 3
    @algorithms = FactoryGirl.create :course, name: "Principles of Algorithms", subject: "CS", call_number: 4050, credit_hours: 4
  end

  test "search should return on successful query" do
    @course1 = Course.search("name", "Algebra")[0]
    assert @course1.eql? @algebra
  end

  test "search should not return a result on unsuccessful query" do
    @course1 = Course.search("name", "Algbra")[0]
    assert @course1.is_a? NilClass
  end
end
