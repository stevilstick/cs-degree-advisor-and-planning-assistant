require 'test_helper'

class SemesterServicesTest < ActionController::TestCase

  def setup
    @student = FactoryGirl.create :user
    @course_plan = FactoryGirl.create :course_plan, student_id: @student.id, plan_name: "Plan 1"
    @year = FactoryGirl.create :year, course_plan_id: @course_plan.id, year: 2015, id:3
  end

  test "should find semesters previous to semester_id = 5(Fall def), in year" do

    year2014 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2014, id: 4
    FactoryGirl.create :semester, year_id: year2014.id, semester_definitions_id: 1 #fall

    winter2015 = FactoryGirl.create :semester, year_id: @year.id,semester_definitions_id: 1 #winter
    summer2015 = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: 4 #summer
    fall2015 = FactoryGirl.create :semester, year_id: @year.id, semester_definitions_id: 5 #fall

    year2016 = FactoryGirl.create :year, course_plan_id: @course_plan.id, year:2016, id:5
    FactoryGirl.create :semester, year_id: year2016.id, semester_definitions_id: 1 #fall

    context = {semester_id:fall2015.id} #@semester has fall as definition
    result = SemesterService.find_past_semesters(context)
    assert result.length == 4, "Only " + result.length.to_s + " course semesters found"
    #The first 2 will be Spring and summer, which are auto generated when a year is created
    assert_equal  winter2015.id, result[2].id
    assert_equal  summer2015.id, result[3].id
  end

end