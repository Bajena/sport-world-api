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

ActiveRecord::Schema.define(version: 20141116113309) do

  create_table "auth_tokens", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "valid_until"
  end

  add_index "auth_tokens", ["user_id"], name: "index_auth_tokens_on_user_id"

  create_table "sports", force: true do |t|
    t.string  "name",                              null: false
    t.integer "calories_per_hour",                 null: false
    t.boolean "requires_distance", default: false, null: false
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.date     "birth_date"
    t.integer  "weight"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workouts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.integer  "sport_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "distance"
  end

end
