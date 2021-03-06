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

ActiveRecord::Schema.define(version: 2019_03_11_102020) do

  create_table "assignments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "time_table_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["time_table_id"], name: "index_assignments_on_time_table_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "time_tables", force: :cascade do |t|
    t.integer "day"
    t.integer "start_time"
    t.integer "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "telephone"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
