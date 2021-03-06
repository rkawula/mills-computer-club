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

ActiveRecord::Schema.define(version: 20160421185340) do

  create_table "hackathons", force: :cascade do |t|
    t.integer  "year"
    t.string   "semester"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "officers", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.boolean  "undergrad"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "contents"
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "published",          default: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "slug"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "resources", force: :cascade do |t|
    t.string   "name"
    t.string   "question"
    t.text     "answer"
    t.string   "url"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "project_name", default: "undecided"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "summary"
    t.string   "email"
    t.boolean  "approved",     default: false
    t.integer  "hackathon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "profile"
    t.boolean  "admin",            default: false, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
