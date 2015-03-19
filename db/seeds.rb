# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(first_name: "Player", last_name: "One", email: "chris.moquin@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
User.create(first_name: "Player", last_name: "Two", email: "trevor.smith@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
CoursePlan.create(id: 1, student_id: 1)
