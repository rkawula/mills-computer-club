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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160305040544) do

  create_table "hackathons", :force => true do |t|
    t.integer  "year"
    t.string   "semester"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "officers", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "img_url"
    t.boolean  "undergrad"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "contents"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "img_url"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "resources", :force => true do |t|
    t.string   "name"
    t.string   "question"
    t.text     "answer"
    t.string   "url"
    t.string   "tag"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "project_name", :default => "undecided"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.text     "summary"
    t.string   "email"
    t.boolean  "approved",     :default => false
    t.integer  "hackathon_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "profile"
    t.boolean  "admin",            :default => false, :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

end
