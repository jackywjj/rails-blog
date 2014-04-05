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

ActiveRecord::Schema.define(version: 20131014083824) do

  create_table "albums", force: true do |t|
    t.string   "title"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "title"
    t.string   "photo_name_file_name"
    t.string   "photo_name_content_type"
    t.integer  "photo_name_file_size"
    t.datetime "photo_name_updated_at"
    t.integer  "status"
    t.integer  "album_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "post_image_file_name"
    t.string   "post_image_content_type"
    t.integer  "post_image_file_size"
    t.datetime "post_image_updated_at"
    t.text     "content"
    t.integer  "status"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "user_name"
    t.string   "user_pass"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
