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

ActiveRecord::Schema.define(version: 20160615014513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "furniture_rooms", force: :cascade do |t|
    t.string   "room_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_stains", force: :cascade do |t|
    t.string   "stain_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "furniture_types", force: :cascade do |t|
    t.string   "furniture_room"
    t.string   "furniture_class"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "furniture_room_id"
  end

  add_index "furniture_types", ["furniture_room_id"], name: "index_furniture_types_on_furniture_room_id", using: :btree

  create_table "furniture_woods", force: :cascade do |t|
    t.string   "wood_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_url"
    t.string   "room_for_furniture"
    t.string   "furniture_type"
    t.string   "furniture_wood"
    t.string   "furniture_stain"
    t.string   "furniture_dimensions"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "furniture_types", "furniture_rooms"
end
