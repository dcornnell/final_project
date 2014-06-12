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

ActiveRecord::Schema.define(version: 20140612201031) do

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

  create_table "grades", force: true do |t|
    t.string  "route_type"
    t.integer "score"
    t.string  "name"
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
  end

  create_table "routes_tags", id: false, force: true do |t|
    t.integer "route_id"
    t.integer "tag_id"
  end

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "total_score"
    t.integer  "role_id",             default: 2
    t.string   "password_digest"
    t.string   "user_name"
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
