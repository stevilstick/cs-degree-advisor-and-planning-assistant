require 'test_helper'

class AddCourseToPlanFromSearchTest < ActionDispatch::IntegrationTest
  def setup
    #Capybara.current_driver = Capybara.javascript_driver # :selenium by default
    Capybara.javascript_driver = :poltergeist
  end

  test "user creates new course plan and adds a course from the search view" do
    visit "/course_plans/"

    # Create a new course plan
    click_link 'New Course Plan'
    fill_in 'course_plan_plan_name', with: 'Capybara Course Plan'
    click_button 'Create Plan'

    # Add a year to the course plan
    fill_in 'year_year', with: 3030
    click_button 'Add Year'
    
    # Add a new course to course plan
    first(:css, '.add-course-link').click
    fill_in 'search', with: 'Computer Science 1'
    click_button 'Search'
    # First fixture course is Computer Science 1, this will be selected
    # first per the Capybara first matcher
    first(:css, "input[type='checkbox']").set(true)
    click_button 'Add Selected'
    assert page.has_content? 'Capybara Course Plan'
    assert page.has_content? 'Computer Organization 2'
  end
end
