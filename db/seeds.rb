# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(first_name: "Player", last_name: "One", email: "chris.moquin@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
User.create(first_name: "Player", last_name: "Two", email: "trevor.smith@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
CoursePlan.create(id: 1, student_id: 1, plan_name: "First")
CoursePlan.create(student_id: 1, plan_name: "Super Secret Graduation Plan")

CourseInstance.create(course_id: 1, semester_id: 1, student_id: 1, rotation_id: 1)

Course.create!(name: 'Computer Science 1', subject: 'CS', call_number: 1050, credit_hours:4, description: "This is the first course in the computer
science core sequence. Students will learn a modern programming language and the basic skills needed to analyze problems and construct programs for 
their solutions. The emphasis of the course is on the techniques of algorithm development, correctness, and programming style. Students are also 
introduced to the fundamentals of software engineering and the software-development life cycle.")
Course.create!(name: 'Computer Science 2', subject: 'CS', call_number: 2050, credit_hours:4, description: "Description for CS 2050")
Course.create!(name: 'Principles of Algorithms', subject: 'CS', call_number: 4050, credit_hours:4, description: "Description for CS 4050")


CourseInstance.create!(course_id: 1, semester_id: 1, student_id: 1, rotation_id: 1)
Year.create!(year: 2015, course_plan_id: 1)
Semester.create!(name: 'Fall', year_id: 1)
