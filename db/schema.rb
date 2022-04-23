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

ActiveRecord::Schema.define(version: 2022_04_23_163221) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["section_id"], name: "index_lessons_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_sections_on_training_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "user_trainings", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "training_id"
    t.integer "completion_rate", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_user_trainings_on_training_id"
    t.index ["user_id"], name: "index_user_trainings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["nickname"], name: "index_users_on_nickname", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ut_sections", force: :cascade do |t|
    t.bigint "user_training_id"
    t.integer "completion_rate", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "section_id"
    t.index ["section_id"], name: "index_ut_sections_on_section_id"
    t.index ["user_training_id"], name: "index_ut_sections_on_user_training_id"
  end

  create_table "uts_lessons", force: :cascade do |t|
    t.bigint "ut_section_id"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "lesson_id"
    t.index ["lesson_id"], name: "index_uts_lessons_on_lesson_id"
    t.index ["ut_section_id"], name: "index_uts_lessons_on_ut_section_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "lessons", "sections"
  add_foreign_key "sections", "trainings"
  add_foreign_key "trainings", "users"
  add_foreign_key "user_trainings", "trainings"
  add_foreign_key "user_trainings", "users"
  add_foreign_key "ut_sections", "sections"
  add_foreign_key "ut_sections", "user_trainings"
  add_foreign_key "uts_lessons", "lessons"
  add_foreign_key "uts_lessons", "ut_sections"
end
