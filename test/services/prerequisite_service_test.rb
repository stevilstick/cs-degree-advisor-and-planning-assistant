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
    assert test_req.length == 2, "Making sure it only found two prerequisite for PPL"
    assert test_req[0].name == "Computer Science 2", "course name =" + test_req[0].name
    assert test_req[1].name == "Computer Organization 2",  "course name =" + test_req[1].name
  end

  #course with id 2 is CS2, is required for PPL with id 4
  test "CS2 is required for PPL, Should get PPL " do
    context = {course_id: 2}
    test_req = PrerequisiteService.isRequiredFor(context)
    assert test_req.length == 1, "Make sure it only found one course for which CS2 is required"
    assert test_req.pop.name == "Principles of Programming Languages"
  end
  
end