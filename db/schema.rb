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

ActiveRecord::Schema.define(version: 20160218001042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appellations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "varietals", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "varietals_wineries", force: :cascade do |t|
    t.integer "varietal_id"
    t.integer "winery_id"
  end

  add_index "varietals_wineries", ["varietal_id"], name: "index_varietals_wineries_on_varietal_id", using: :btree
  add_index "varietals_wineries", ["winery_id"], name: "index_varietals_wineries_on_winery_id", using: :btree

  create_table "wineries", force: :cascade do |t|
    t.string   "name",       default: ""
    t.string   "address",    default: ""
    t.string   "city",       default: ""
    t.string   "state",      default: ""
    t.string   "phone",      default: ""
    t.string   "website",    default: ""
    t.boolean  "wine_club",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
