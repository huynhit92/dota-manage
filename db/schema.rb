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

ActiveRecord::Schema.define(version: 20151229021352) do

  create_table "banners", force: :cascade do |t|
    t.string   "lp_url",       limit: 255,   default: "", null: false
    t.string   "img_url",      limit: 255,   default: "", null: false
    t.text     "description",  limit: 65535
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,     default: 0
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "blog_categories", force: :cascade do |t|
    t.string   "name",         limit: 255,             null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "user_id",          limit: 4,                 null: false
    t.integer  "blog_category_id", limit: 4,                 null: false
    t.string   "title",            limit: 255,               null: false
    t.text     "content",          limit: 65535,             null: false
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.integer  "lock_version",     limit: 4,     default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "blogs", ["blog_category_id"], name: "index_blogs_on_blog_category_id", using: :btree
  add_index "blogs", ["user_id"], name: "index_blogs_on_user_id", using: :btree

  create_table "divides", force: :cascade do |t|
    t.string   "name",         limit: 255,             null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "grown_level_masters", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "heroes", force: :cascade do |t|
    t.string   "name",               limit: 255,   default: "", null: false
    t.integer  "hero_type",          limit: 4,     default: 1,  null: false
    t.integer  "position",           limit: 4,                  null: false
    t.text     "description",        limit: 65535
    t.integer  "base_star",          limit: 4,                  null: false
    t.integer  "rcm_star",           limit: 4,                  null: false, comment: "cap sao de nghi"
    t.integer  "get_start_dif",      limit: 4,                  null: false, comment: "do kho nhap mon"
    t.integer  "grant_star_dif",     limit: 4,                  null: false, comment: "do kho len sao"
    t.integer  "damage_point",       limit: 4,                  null: false, comment: "sat thuong gay ra"
    t.integer  "team_support_point", limit: 4,                  null: false, comment: "ho tro nhom"
    t.integer  "str_point",          limit: 4,                  null: false, comment: "chi so suc manh"
    t.integer  "int_point",          limit: 4,                  null: false, comment: "chi so tri tue"
    t.integer  "agi_point",          limit: 4,                  null: false, comment: "chi so man tiep"
    t.integer  "max_hp",             limit: 4,                  null: false, comment: "hp toi da"
    t.integer  "physic_dmg",         limit: 4,                  null: false, comment: "luc cong vat ly"
    t.integer  "magic_dmg",          limit: 4,                  null: false, comment: "cuong do phep"
    t.integer  "magic_regist",       limit: 4,                  null: false, comment: "khang phep"
    t.integer  "physic_shield",      limit: 4,                  null: false, comment: "ho giap vat ly"
    t.integer  "physic_chaos",       limit: 4,                  null: false, comment: "bao kich vat ly"
    t.string   "img_url",            limit: 255,   default: "", null: false
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.integer  "lock_version",       limit: 4,     default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "heroes", ["base_star"], name: "index_heroes_on_base_star", using: :btree
  add_index "heroes", ["get_start_dif"], name: "index_heroes_on_get_start_dif", using: :btree
  add_index "heroes", ["grant_star_dif"], name: "index_heroes_on_grant_star_dif", using: :btree
  add_index "heroes", ["hero_type"], name: "index_heroes_on_hero_type", using: :btree
  add_index "heroes", ["position"], name: "index_heroes_on_position", using: :btree
  add_index "heroes", ["rcm_star"], name: "index_heroes_on_rcm_star", using: :btree

  create_table "item_sets", force: :cascade do |t|
    t.integer  "rel_hero_divide_id", limit: 4,             null: false
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.integer  "lock_version",       limit: 4, default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "item_sets", ["rel_hero_divide_id"], name: "index_item_sets_on_rel_hero_divide_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.text     "name",           limit: 65535,             null: false
    t.integer  "required_level", limit: 4,                 null: false
    t.text     "description",    limit: 65535
    t.text     "made_of",        limit: 65535
    t.text     "can_create",     limit: 65535
    t.text     "hero_use",       limit: 65535
    t.text     "receive_method", limit: 65535
    t.integer  "quality",        limit: 4
    t.integer  "item_type",      limit: 4
    t.string   "img_url",        limit: 255,               null: false
    t.integer  "created_by",     limit: 4
    t.integer  "updated_by",     limit: 4
    t.integer  "lock_version",   limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4,                null: false
    t.string   "content",      limit: 255, default: "", null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "rel_hero_divides", force: :cascade do |t|
    t.integer  "hero_id",      limit: 4,             null: false
    t.integer  "divide_id",    limit: 4,             null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4, default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "rel_hero_divides", ["hero_id", "divide_id"], name: "index_rel_hero_divides_on_hero_id_and_divide_id", using: :btree

  create_table "rel_hero_grown_levels", force: :cascade do |t|
    t.integer  "hero_id",               limit: 4,              null: false
    t.integer  "grown_level_master_id", limit: 4,              null: false
    t.float    "str",                   limit: 24,             null: false
    t.float    "int",                   limit: 24,             null: false
    t.float    "agi",                   limit: 24,             null: false
    t.integer  "created_by",            limit: 4
    t.integer  "updated_by",            limit: 4
    t.integer  "lock_version",          limit: 4,  default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "rel_hero_grown_levels", ["hero_id", "grown_level_master_id"], name: "index_rel_hero_grown_levels_on_hero_id_and_grown_level_master_id", unique: true, using: :btree
  add_index "rel_hero_grown_levels", ["hero_id"], name: "index_rel_hero_grown_levels_on_hero_id", using: :btree

  create_table "rel_set_items", force: :cascade do |t|
    t.integer  "item_set_id",  limit: 4,             null: false
    t.integer  "item_id",      limit: 4,             null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4, default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "rel_set_items", ["item_set_id", "item_id"], name: "index_rel_set_items_on_item_set_id_and_item_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "hero_id",      limit: 4,                 null: false
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535,             null: false
    t.string   "img_url",      limit: 255,               null: false
    t.integer  "created_by",   limit: 4
    t.integer  "updated_by",   limit: 4
    t.integer  "lock_version", limit: 4,     default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "skills", ["hero_id"], name: "index_skills_on_hero_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "user_name",          limit: 255, default: "", null: false
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.integer  "role",               limit: 4,   default: 2,  null: false
    t.integer  "created_by",         limit: 4
    t.integer  "updated_by",         limit: 4
    t.integer  "lock_version",       limit: 4,   default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end
