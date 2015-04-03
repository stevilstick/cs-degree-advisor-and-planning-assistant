require 'test_helper'
class CoursePlansControllerTest < ActionController::TestCase
  test "should return course instance's with semester_id equal to 1" do
    context = {semester_id: 1}
    result = CourseInstanceService.new.find(context)
    assert result.new.get_semester_id() == context[:semester_id]
  end

end
