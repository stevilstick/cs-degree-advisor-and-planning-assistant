require 'test_helper'
class PrerequisiteServiceTest < ActionController::TestCase
  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
  end
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
  test "should get CS2 and CS2400 as prerequisites of PPL with id 4(Testing: getPrerequisites)" do
    context = {course_id: 4}
    test_req = PrerequisiteService.getPrerequisites(context)
    assert test_req.length == 2, "Making sure it only found two prerequisite for PPL"
    assert test_req[0].name == "Computer Science 2", "course name =" + test_req[0].name
    assert test_req[1].name == "Computer Organization 2",  "course name =" + test_req[1].name
  end

  #course with id 2 is CS2, is required for PPL with id 4
  test "CS2 is required for PPL, Should get PPL(testing: isRequiredFor)" do
    context = {course_id: 2}
    test_req = PrerequisiteService.isRequiredFor(context)
    assert test_req.length == 1, "Make sure it only found one course for which CS2 is required"
    assert test_req.pop.name == "Principles of Programming Languages"
  end

  #course with id 2 is PPL, will need cs2
  test "CS2 must be taken for PPL, Should get CS(testing:needToBeCompleted)" do
    year1 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2014
    year2 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2013
    semester = FactoryGirl.create :semester, year_id: year1.id, semester_definitions_id: 2 #spring
    semester2 =  FactoryGirl.create :semester, year_id: year2.id, semester_definitions_id: 4 #summer
    course1 = FactoryGirl.create :course_instance, semester_id: semester.id, course_id: 1 #CS1015
    FactoryGirl.create :course_instance, semester_id: semester2.id, course_id: 3 #CS2400
    # to make sure it doesn't get future years
    year3 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2016
    semester3 = FactoryGirl.create :semester, year_id: year3.id, semester_definitions_id: 4 #summer
    course3 = FactoryGirl.create :course_instance, semester_id: semester3.id, course_id: 4 # CS3210

    context = {course_instance_id: course3.id} #@semester has fall as definition
    test_req = PrerequisiteService.needToBeCompleted(context)
    assert test_req.length == 1, "Make sure it only found one course for which CS2 is required"
    assert test_req.pop.name == "Computer Science 2"
  end

  #course with id 2 is PPL, will need cs2
  test "CS2 must be taken for PPL, Should get false(testing:hasCompletedPrerequisites)" do
    year1 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2014
    year2 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2013
    semester = FactoryGirl.create :semester, year_id: year1.id, semester_definitions_id: 2 #spring
    semester2 =  FactoryGirl.create :semester, year_id: year2.id, semester_definitions_id: 4 #summer
    course1 = FactoryGirl.create :course_instance, semester_id: semester.id, course_id: 1 #CS1015
    FactoryGirl.create :course_instance, semester_id: semester2.id, course_id: 3 #CS2400
    # to make sure it doesn't get future years
    year3 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2016
    semester3 = FactoryGirl.create :semester, year_id: year3.id, semester_definitions_id: 4 #summer
    course3 = FactoryGirl.create :course_instance, semester_id: semester3.id, course_id: 4 # CS3210

    context = {course_instance_id: course3.id} #@semester has fall as definition
    test_req = PrerequisiteService.hasCompletedPrerequisites(context)
    assert !test_req, "should be false CS2 is required, and is not in the schedule"

    FactoryGirl.create :course_instance, semester_id: semester.id, course_id: 2 #CS2015

    test_req2 = PrerequisiteService.hasCompletedPrerequisites(context)
    assert test_req2, "Should be true all prerequisites are in the schedule"
  end


end