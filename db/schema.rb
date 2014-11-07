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

ActiveRecord::Schema.define(version: 20141107164023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "description_source"
    t.text     "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ip_address"
    t.string   "slug"
    t.boolean  "is_private",         default: false
    t.boolean  "deleted",            default: false
  end

  add_index "posts", ["deleted"], name: "index_posts_on_deleted", using: :btree
  add_index "posts", ["is_private"], name: "index_posts_on_is_private", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name",       limit: 50, null: false
    t.string   "slug",       limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tags", ["slug"], name: "index_tags_on_slug", unique: true, using: :btree

end
