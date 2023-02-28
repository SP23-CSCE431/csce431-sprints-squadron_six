# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_02_28_081540) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnis", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_alumnis_on_company_id"
    t.index ["user_id"], name: "index_alumnis_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_location"
    t.string "company_industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.integer "course_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.date "exam_date"
    t.string "exam_grade"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exams_on_course_id"
  end

  create_table "performances", force: :cascade do |t|
    t.integer "performance_points"
    t.bigint "exam_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_performances_on_exam_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_fname"
    t.string "user_lname"
    t.string "user_email"
    t.string "user_password"
    t.string "user_role"
    t.date "user_grad_year"
    t.integer "user_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "alumnis", "companies"
  add_foreign_key "alumnis", "users"
  add_foreign_key "exams", "courses"
  add_foreign_key "performances", "exams"
  add_foreign_key "performances", "users"
end
