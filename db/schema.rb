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

ActiveRecord::Schema.define(version: 20180226153117) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mentor_profils", force: :cascade do |t|
    t.text "experience"
    t.integer "minimum_price"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_mentor_profils_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "mentor_profil_id"
    t.bigint "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mentor_profil_id"], name: "index_tags_on_mentor_profil_id"
    t.index ["skill_id"], name: "index_tags_on_skill_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "price"
    t.string "ticket_skills"
    t.string "ticket_duration"
    t.string "ticket_location"
    t.string "priority"
    t.string "status"
    t.integer "alumni_id"
    t.integer "mentor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumni_id"], name: "index_tickets_on_alumni_id"
    t.index ["mentor_id"], name: "index_tickets_on_mentor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "mentor_profils", "users"
  add_foreign_key "tags", "mentor_profils"
  add_foreign_key "tags", "skills"
end
