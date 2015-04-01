# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(first_name: "Player", last_name: "One", email: "chris.moquin@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
User.create(first_name: "Player", last_name: "Two", email: "trevor.smith@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
CoursePlan.create!(student_id: 1)
Course.create!(name: 'Computer Science 1', subject: 'CS', call_number: 1050, credit_hours:4)
CourseInstance.create!(course_id: 1, semester_id: 1, student_id: 1, rotation_id: 1)
Year.create!(year: 2015, course_plan_id: 1)
Semester.create!(name: 'Fall', year_id: 1)