require 'test_helper'
class CoursePlansControllerTest < ActionController::TestCase
  
  #course with id 2 is CS2, and has zero 1 prerequisite CS1   
  test "should get one prerequisite" do
    test_req = PrerequisiteService.getPrerequisites 2
    assert test_req.count == 1
  end

  #course with id 1 is CS1 , and has zero prerequisites    
  test "should get zero prerequisites" do
    test_req = PrerequisiteService.getPrerequisites 1
    assert test_req.count == 0
  end

  #course with id 1 is CS1 , and has zero prerequisites    
  test "should get CS1 with id 1 as prerequisite of cs2 with id 2" do
    test_req = PrerequisiteService.getPrerequisites 2
    assert test_req.pop.name == "Computer Science 1"
    assert test_req.length == 0, "Making sure it only found one prerequisite for CS2"
  end
  
end