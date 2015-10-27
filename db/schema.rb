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

ActiveRecord::Schema.define(version: 20151027040424) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "profile_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["profile_id"], name: "index_comments_on_profile_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "locations", force: :cascade do |t|
    t.string   "city",               limit: 255
    t.string   "administrationarea", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "image",              limit: 255
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
    t.integer  "skill_id",           limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "pictures", ["skill_id"], name: "index_pictures_on_skill_id", using: :btree

  create_table "profile_categoryships", force: :cascade do |t|
    t.integer  "profile_id",  limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "profile_categoryships", ["category_id"], name: "index_profile_categoryships_on_category_id", using: :btree
  add_index "profile_categoryships", ["profile_id"], name: "index_profile_categoryships_on_profile_id", using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "username",              limit: 255
    t.text     "description",           limit: 65535
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "user_id",               limit: 4
    t.string   "photo_file_name",       limit: 255
    t.string   "photo_content_type",    limit: 255
    t.integer  "photo_file_size",       limit: 4
    t.datetime "photo_updated_at"
    t.integer  "location_id",           limit: 4
    t.integer  "favorited_users_count", limit: 4,     default: 0
  end

  add_index "profiles", ["location_id"], name: "index_profiles_on_location_id", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "publiccomments", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "profile_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "publiccomments", ["profile_id"], name: "index_publiccomments_on_profile_id", using: :btree
  add_index "publiccomments", ["user_id"], name: "index_publiccomments_on_user_id", using: :btree

  create_table "skill_categoryships", force: :cascade do |t|
    t.integer  "skill_id",    limit: 4
    t.integer  "category_id", limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "skill_categoryships", ["category_id"], name: "index_skill_categoryships_on_category_id", using: :btree
  add_index "skill_categoryships", ["skill_id"], name: "index_skill_categoryships_on_skill_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "requirement",       limit: 65535
    t.text     "description",       limit: 65535
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "user_id",           limit: 4
    t.integer  "liked_users_count", limit: 4,     default: 0
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id", using: :btree

  create_table "user_profile_favoriteships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "profile_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_profile_favoriteships", ["profile_id"], name: "index_user_profile_favoriteships_on_profile_id", using: :btree
  add_index "user_profile_favoriteships", ["user_id"], name: "index_user_profile_favoriteships_on_user_id", using: :btree

  create_table "user_skill_likeships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "skill_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "user_skill_likeships", ["skill_id"], name: "index_user_skill_likeships_on_skill_id", using: :btree
  add_index "user_skill_likeships", ["user_id"], name: "index_user_skill_likeships_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "fb_uid",                 limit: 255
    t.string   "fb_token",               limit: 255
    t.string   "role",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
