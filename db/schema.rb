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

ActiveRecord::Schema.define(version: 20160711110140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"
  enable_extension "pg_trgm"
  enable_extension "fuzzystrmatch"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "app_settings", force: :cascade do |t|
    t.boolean  "slider_option",         default: false
    t.boolean  "map_option",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enable_chat",           default: true
    t.boolean  "include_suppliers",     default: true
    t.integer  "root_page_parts_count", default: 4
    t.string   "phone"
    t.string   "email"
    t.text     "keywords"
    t.text     "description"
    t.boolean  "contact_form",          default: false
    t.integer  "search_limit",          default: 15
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "contact_type"
    t.integer  "department_id"
    t.string   "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.integer  "subsidiary_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "department_id"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "footer"
  end

  create_table "gallery_items", force: :cascade do |t|
    t.integer  "gallery_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "gallery_items", ["gallery_id"], name: "index_gallery_items_on_gallery_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title"
    t.text     "text_1"
    t.text     "text_2"
    t.text     "text_3"
    t.string   "locale"
    t.integer  "page_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link_name"
    t.integer  "gallery_id"
    t.text     "keywords",                  default: ""
    t.string   "description",               default: ""
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.boolean  "show_contacts",             default: true
  end

  create_table "parts", force: :cascade do |t|
    t.string   "name"
    t.string   "manufacturer_id"
    t.string   "seller_id"
    t.decimal  "price",           precision: 8, scale: 2
    t.boolean  "winter",                                  default: false
    t.boolean  "truck",                                   default: false
    t.string   "brand"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "truck_id"
    t.boolean  "order",                                   default: false
    t.string   "internal_id"
  end

  add_index "parts", ["internal_id"], name: "index_parts_on_internal_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "post_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string   "name_en"
    t.string   "name_ro"
    t.string   "name_ru"
    t.string   "address_en"
    t.string   "address_ro"
    t.string   "address_ru"
    t.string   "gps"
    t.string   "external_id"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
