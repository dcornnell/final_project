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

ActiveRecord::Schema.define(version: 20140908192553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attempts", force: true do |t|
    t.integer  "user_id"
    t.integer  "route_id"
    t.date     "date_attempted"
    t.boolean  "flash"
    t.boolean  "completed"
    t.integer  "attempt_score"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string  "content"
    t.integer "commentable_id"
    t.string  "commentable_type"
    t.integer "user_id"
  end

  create_table "friendships", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "grades", force: true do |t|
    t.string  "route_type"
    t.integer "score"
    t.string  "name"
  end

  create_table "locations", force: true do |t|
    t.string  "address"
    t.float   "latitude"
    t.float   "longitude"
    t.string  "name"
    t.boolean "camping",     default: false
    t.string  "rock_type"
    t.text    "description"
  end

  create_table "posts", force: true do |t|
    t.string  "title"
    t.integer "user_id"
    t.text    "post"
    t.date    "post_date"
  end

  create_table "ratings", force: true do |t|
    t.integer "user_id"
    t.integer "route_id"
    t.decimal "rating"
  end

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "routes", force: true do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.string   "info"
    t.integer  "modifier"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
  end

  create_table "routes_tags", id: false, force: true do |t|
    t.integer "route_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role_id",                default: 2
    t.integer  "total_score",            default: 0
    t.string   "user_name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
