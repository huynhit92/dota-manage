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

ActiveRecord::Schema.define(version: 20150912043740) do

  create_table "divides", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.string   "name",        limit: 255,   default: "", null: false
    t.integer  "hero_type",   limit: 4,     default: 1,  null: false
    t.text     "description", limit: 65535
    t.string   "img_url",     limit: 255,   default: "", null: false
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "item_sets", force: :cascade do |t|
    t.integer  "rel_hero_divide_id", limit: 4, null: false
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "item_sets", ["rel_hero_divide_id"], name: "index_item_sets_on_rel_hero_divide_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "name",       limit: 65535, null: false
    t.string   "img_url",    limit: 255,   null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4,                null: false
    t.string   "content",    limit: 255, default: "", null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "rel_hero_divides", force: :cascade do |t|
    t.integer  "hero_id",    limit: 4, null: false
    t.integer  "divide_id",  limit: 4, null: false
    t.integer  "created_by", limit: 4
    t.integer  "updated_by", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rel_hero_divides", ["hero_id", "divide_id"], name: "index_rel_hero_divides_on_hero_id_and_divide_id", using: :btree

  create_table "rel_set_items", force: :cascade do |t|
    t.integer  "item_set_id", limit: 4, null: false
    t.integer  "item_id",     limit: 4, null: false
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "rel_set_items", ["item_set_id", "item_id"], name: "index_rel_set_items_on_item_set_id_and_item_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "hero_id",     limit: 4,     null: false
    t.text     "description", limit: 65535, null: false
    t.string   "img_url",     limit: 255,   null: false
    t.integer  "created_by",  limit: 4
    t.integer  "updated_by",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "skills", ["hero_id"], name: "index_skills_on_hero_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",          limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.integer  "role",               limit: 4,   default: 2,  null: false
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
