# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_26_155343) do

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "doctor_id", null: false
    t.text "info"
    t.string "meeting_link"
    t.string "guest"
    t.date "date"
    t.time "time"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.text "prevention"
    t.text "treatment"
    t.integer "speciality_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["speciality_id"], name: "index_diseases_on_speciality_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.string "hospital"
    t.string "age"
    t.string "experience_year"
    t.integer "speciality_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["speciality_id"], name: "index_doctors_on_speciality_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "healthinfos", force: :cascade do |t|
    t.string "age"
    t.string "gender"
    t.string "weight"
    t.string "height"
    t.text "family"
    t.text "personal"
    t.text "text1"
    t.text "text2"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_healthinfos_on_user_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "created_by"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_specialities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "status"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "users"
  add_foreign_key "diseases", "specialities"
  add_foreign_key "doctors", "specialities"
  add_foreign_key "doctors", "users"
  add_foreign_key "healthinfos", "users"
  add_foreign_key "specialities", "users"
end
