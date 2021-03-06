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

ActiveRecord::Schema.define(version: 20170119183945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_assignments_on_course_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "number"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id", using: :btree
  end

  create_table "enrollments", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "student_id"
    t.float    "tot_grade",  default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id", using: :btree
    t.index ["student_id"], name: "index_enrollments_on_student_id", using: :btree
  end

  create_table "grades", force: :cascade do |t|
    t.float    "grade"
    t.integer  "assignment_id"
    t.integer  "student_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["assignment_id"], name: "index_grades_on_assignment_id", using: :btree
    t.index ["student_id"], name: "index_grades_on_student_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.float    "gpa"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id", using: :btree
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "access_level"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
