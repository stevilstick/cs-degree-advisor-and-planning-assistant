# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150417154854) do

  create_table "advisor_students", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "advisor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advisor_students", ["advisor_id"], name: "index_advisor_students_on_advisor_id"
  add_index "advisor_students", ["student_id"], name: "index_advisor_students_on_student_id"

  create_table "advisors", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advisors", ["user_id"], name: "index_advisors_on_user_id"

  create_table "course_instances", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "semester_id"
    t.integer  "student_id"
    t.integer  "rotation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prerequisites"
  end

  add_index "course_instances", ["course_id"], name: "index_course_instances_on_course_id"
  add_index "course_instances", ["rotation_id"], name: "index_course_instances_on_rotation_id"
  add_index "course_instances", ["semester_id"], name: "index_course_instances_on_semester_id"
  add_index "course_instances", ["student_id"], name: "index_course_instances_on_student_id"

  create_table "course_plans", force: :cascade do |t|
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "plan_name"
  end

  add_index "course_plans", ["student_id"], name: "index_course_plans_on_student_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.integer  "call_number"
    t.decimal  "credit_hours", precision: 10, scale: 2
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "degree_requirements", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "degree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "degree_requirements", ["course_id"], name: "index_degree_requirements_on_course_id"
  add_index "degree_requirements", ["degree_id"], name: "index_degree_requirements_on_degree_id"

  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.integer  "total_credits"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prerequisites", force: :cascade do |t|
    t.integer  "this_course_id"
    t.integer  "target_course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "required_credit_hours", precision: 10, scale: 2
    t.integer  "type"
    t.string   "subject"
  end

  add_index "prerequisites", ["target_course_id"], name: "index_prerequisites_on_target_course_id"
  add_index "prerequisites", ["this_course_id"], name: "index_prerequisites_on_this_course_id"

  create_table "rotations", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "semester_definitions", force: :cascade do |t|
    t.integer  "semesters_id"
    t.string   "name"
    t.integer  "in_year_position"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.decimal  "max_credit_hours", precision: 10, scale: 2
  end

  create_table "semesters", force: :cascade do |t|
    t.integer  "year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "semester_definitions_id"
  end

  add_index "semesters", ["semester_definitions_id"], name: "index_semesters_on_semester_definitions_id"
  add_index "semesters", ["year_id"], name: "index_semesters_on_year_id"

  create_table "students", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id"

  create_table "trigrams", force: :cascade do |t|
    t.string  "trigram",     limit: 3
    t.integer "score",       limit: 2
    t.integer "owner_id"
    t.string  "owner_type"
    t.string  "fuzzy_field"
  end

  add_index "trigrams", ["owner_id", "owner_type", "fuzzy_field", "trigram", "score"], name: "index_for_match"
  add_index "trigrams", ["owner_id", "owner_type"], name: "index_by_owner"

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "last_name"
    t.integer  "type"
  end

  create_table "years", force: :cascade do |t|
    t.integer  "course_plan_id"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["course_plan_id"], name: "index_years_on_course_plan_id"

end
