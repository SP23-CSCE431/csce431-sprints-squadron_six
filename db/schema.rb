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

ActiveRecord::Schema[7.0].define(version: 20_230_407_232_735) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'adminusers', force: :cascade do |t|
    t.string 'email'
    t.boolean 'isaadmin'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'alumnis', force: :cascade do |t|
    t.bigint 'company_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['company_id'], name: 'index_alumnis_on_company_id'
    t.index ['user_id'], name: 'index_alumnis_on_user_id'
  end

  create_table 'authusers', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'full_name'
    t.string 'uid'
    t.string 'avatar_url'
    t.string 'provider'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.boolean 'admin', default: false
    t.index ['email'], name: 'index_authusers_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_authusers_on_reset_password_token', unique: true
  end

  create_table 'companies', force: :cascade do |t|
    t.string 'company_name'
    t.string 'company_location'
    t.string 'company_industry'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'courses', force: :cascade do |t|
    t.string 'course_name'
    t.integer 'course_hours'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'exams', force: :cascade do |t|
    t.date 'exam_date'
    t.string 'exam_grade'
    t.bigint 'course_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'user_id'
    t.string 'avatar'
    t.index ['course_id'], name: 'index_exams_on_course_id'
  end

  create_table 'performances', force: :cascade do |t|
    t.integer 'performance_points'
    t.bigint 'exam_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['exam_id'], name: 'index_performances_on_exam_id'
    t.index ['user_id'], name: 'index_performances_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'user_fname'
    t.string 'user_lname'
    t.string 'user_email'
    t.string 'user_role'
    t.date 'user_grad_year'
    t.integer 'user_points'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'authuser_id'
    t.index ['authuser_id'], name: 'index_users_on_authuser_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'alumnis', 'companies'
  add_foreign_key 'alumnis', 'users'
  add_foreign_key 'exams', 'courses'
  add_foreign_key 'performances', 'exams'
  add_foreign_key 'performances', 'users'
  add_foreign_key 'users', 'authusers'
end
