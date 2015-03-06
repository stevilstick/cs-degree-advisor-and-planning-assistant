# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(name: "Player 1", email: "chris.moquin@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
User.create(name: "Player 2", email: "trevor.smith@msudenver.edu",
            password: "foobar", password_confirmation: "foobar")
