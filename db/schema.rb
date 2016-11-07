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

ActiveRecord::Schema.define(version: 20161107043614) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_us", force: :cascade do |t|
    t.string   "about_us_image_file_name"
    t.string   "about_us_image_content_type"
    t.integer  "about_us_image_file_size"
    t.datetime "about_us_image_updated_at"
    t.text     "body"
    t.string   "phone_number",                limit: 10
    t.string   "email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "address"
    t.string   "hours"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "blog_post"
    t.string   "blog_image_file_name"
    t.string   "blog_image_content_type"
    t.integer  "blog_image_file_size"
    t.datetime "blog_image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "furniture_rooms", force: :cascade do |t|
    t.string   "room_type"
    t.string   "room_image_file_name"
    t.string   "room_image_content_type"
    t.integer  "room_image_file_size"
    t.datetime "room_image_updated_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "furniture_stains", force: :cascade do |t|
    t.string   "stain_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_styles", force: :cascade do |t|
    t.string   "furniture_style"
    t.string   "furniture_style_image_file_name"
    t.string   "furniture_style_image_content_type"
    t.integer  "furniture_style_image_file_size"
    t.datetime "furniture_style_image_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "furniture_types", force: :cascade do |t|
    t.string   "furniture_room_for_class"
    t.string   "furniture_class"
    t.string   "furniture_type_image_file_name"
    t.string   "furniture_type_image_content_type"
    t.integer  "furniture_type_image_file_size"
    t.datetime "furniture_type_image_updated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "furniture_room_id"
  end

  add_index "furniture_types", ["furniture_room_id"], name: "index_furniture_types_on_furniture_room_id", using: :btree

  create_table "furniture_woods", force: :cascade do |t|
    t.string   "wood_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homepage_posts", force: :cascade do |t|
    t.string   "post_title"
    t.text     "post_text"
    t.string   "post_img_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "room_for_furniture"
    t.string   "furniture_type"
    t.string   "furniture_wood"
    t.string   "furniture_stain"
    t.string   "furniture_dimensions"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "furniture_style"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "user_image_file_name"
    t.string   "user_image_content_type"
    t.integer  "user_image_file_size"
    t.datetime "user_image_updated_at"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role_name"
    t.integer  "role_id"
    t.text     "first_name"
    t.text     "last_name"
    t.string   "referral"
    t.string   "user_review"
    t.text     "phone_number"
    t.text     "email"
    t.text     "address"
    t.text     "apt_number"
    t.text     "city"
    t.text     "state"
    t.text     "zip_code"
    t.string   "activation_digest"
    t.boolean  "activated",               default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id", using: :btree

  add_foreign_key "carts", "users"
  add_foreign_key "furniture_types", "furniture_rooms"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "products"
  add_foreign_key "users", "roles"
end
