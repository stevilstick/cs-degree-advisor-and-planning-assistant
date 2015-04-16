require 'test_helper'
class PrerequisiteServiceTest < ActionController::TestCase
  
  #course with id 2 is CS2, and has one prerequisite CS1
  test "should get one prerequisite" do
    context = {course_id: 2}
    test_req = PrerequisiteService.getPrerequisites(context)
    assert test_req.count == 1
  end

  #course with id 1 is CS1 , and has zero prerequisites    
  test "should get zero prerequisites" do
    context = {course_id: 1}
    test_req = PrerequisiteService.getPrerequisites(context)
    assert test_req.count == 0
  end

  #course with id 4 is PPL, and has two prerequisites
  test "should get CS2 and CS2400 as prerequisites of PPL with id 4" do
    context = {course_id: 4}
    test_req = PrerequisiteService.getPrerequisites(context)
    assert test_req.length == 2, "Making sure it only found one prerequisite for CS2"
    assert test_req[0].name == "Computer Organization 2"
    assert test_req[1].name == "Computer Science 1"
  end
  
end