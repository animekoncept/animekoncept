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

ActiveRecord::Schema.define(version: 20160415024708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "animelists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "anime_id"
    t.string   "status"
    t.integer  "episodes_watched",                         default: 0
    t.decimal  "rating",           precision: 2, scale: 1
    t.integer  "rewatched",                                default: 0
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
  end

  add_index "animelists", ["anime_id"], name: "index_animelists_on_anime_id", using: :btree
  add_index "animelists", ["user_id"], name: "index_animelists_on_user_id", using: :btree

  create_table "animes", force: :cascade do |t|
    t.string   "name"
    t.text     "synopsis"
    t.date     "aired_on"
    t.date     "ended_on"
    t.string   "duration"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug"
    t.integer  "season_id"
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
  end

  add_index "animes", ["slug"], name: "index_animes_on_slug", unique: true, using: :btree

  create_table "animes_genres", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "genre_id"
  end

  create_table "animes_producers", force: :cascade do |t|
    t.integer "anime_id"
    t.integer "producer_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "location"
    t.date     "starts_on"
    t.date     "ends_on"
    t.string   "age"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.string   "website"
    t.string   "address"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "genres", ["slug"], name: "index_genres_on_slug", unique: true, using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "marker_id"
    t.string   "marker_type"
    t.integer  "markable_id"
    t.string   "markable_type"
    t.string   "mark",          limit: 128
    t.datetime "created_at"
  end

  add_index "marks", ["markable_id", "markable_type", "mark"], name: "index_marks_on_markable_id_and_markable_type_and_mark", using: :btree
  add_index "marks", ["marker_id", "marker_type", "mark"], name: "index_marks_on_marker_id_and_marker_type_and_mark", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "topic_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "producers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "producers", ["slug"], name: "index_producers_on_slug", unique: true, using: :btree

  create_table "punches", force: :cascade do |t|
    t.integer  "punchable_id",                          null: false
    t.string   "punchable_type", limit: 20,             null: false
    t.datetime "starts_at",                             null: false
    t.datetime "ends_at",                               null: false
    t.datetime "average_time",                          null: false
    t.integer  "hits",                      default: 1, null: false
  end

  add_index "punches", ["average_time"], name: "index_punches_on_average_time", using: :btree
  add_index "punches", ["punchable_type", "punchable_id"], name: "punchable_index", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  add_index "seasons", ["slug"], name: "index_seasons_on_slug", unique: true, using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                     default: "", null: false
    t.string   "encrypted_password",        default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",             default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "username"
    t.string   "slug"
    t.integer  "role_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree

  add_foreign_key "animelists", "animes"
  add_foreign_key "animelists", "users"
  add_foreign_key "users", "roles"
end
