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

ActiveRecord::Schema.define(version: 20160914233027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.text     "link"
    t.text     "link_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_options", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "options_enabled"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["user_id"], name: "index_admin_options_on_user_id", using: :btree
  end

  create_table "announcements", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "link"
    t.index ["user_id"], name: "index_announcements_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
    t.index ["work_id"], name: "index_comments_on_work_id", using: :btree
  end

  create_table "favourites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favourites_on_user_id", using: :btree
    t.index ["work_id"], name: "index_favourites_on_work_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "histories", force: :cascade do |t|
    t.integer  "work_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_histories_on_user_id", using: :btree
    t.index ["work_id"], name: "index_histories_on_work_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "body"
    t.integer  "category"
    t.text     "link"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "unread"
    t.integer  "notifier"
    t.index ["notifier"], name: "index_notifications_on_notifier", using: :btree
    t.index ["user_id"], name: "index_notifications_on_user_id", using: :btree
  end

  create_table "novels", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.string   "taggable_type"
    t.integer  "taggable_id"
    t.string   "tagger_type"
    t.integer  "tagger_id"
    t.string   "context",       limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context", using: :btree
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy", using: :btree
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id", using: :btree
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type", using: :btree
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type", using: :btree
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end

  create_table "user_follows", id: false, force: :cascade do |t|
    t.integer "user_a_id", null: false
    t.integer "user_b_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.string   "password_digest"
    t.text     "about"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.boolean  "is_admin"
    t.datetime "last_seen"
    t.text     "nanowrimo_name"
    t.text     "admin_description"
    t.string   "slug"
    t.integer  "unread_notifications"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

  create_table "works", force: :cascade do |t|
    t.text     "title"
    t.text     "body"
    t.boolean  "incomplete"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.boolean  "is_private"
    t.index ["user_id"], name: "index_works_on_user_id", using: :btree
  end

  add_foreign_key "admin_options", "users"
  add_foreign_key "announcements", "users"
  add_foreign_key "comments", "users"
  add_foreign_key "comments", "works"
  add_foreign_key "favourites", "users"
  add_foreign_key "favourites", "works"
  add_foreign_key "histories", "users"
  add_foreign_key "histories", "works"
  add_foreign_key "notifications", "users"
  add_foreign_key "works", "users"
end
