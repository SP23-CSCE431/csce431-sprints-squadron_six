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

ActiveRecord::Schema[7.0].define(version: 2023_02_12_024424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "points", force: :cascade do |t|
    t.string "user_id"
    t.integer "total_points"
    
ActiveRecord::Schema[7.0].define(version: 2023_02_13_165642) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alumnis", force: :cascade do |t|
    t.integer "ID"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "graduation_year"
    t.string "company"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authusers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.string "provider"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_authusers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_authusers_on_reset_password_token", unique: true
  end

  create_table "budgets", force: :cascade do |t|
    t.string "user"
    t.string "expense_type"
    t.float "amount"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exams", force: :cascade do |t|
    t.string "user_id"
    t.date "exam_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.string "user_id"
    t.string "grade"
    t.integer "points"

    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "role"

    t.integer "uin"

    t.date "grad_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
