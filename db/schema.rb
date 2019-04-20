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

ActiveRecord::Schema.define(version: 20190420000111) do

  create_table "ads", force: :cascade do |t|
    t.integer "business_id"
    t.integer "publisher_id"
    t.string "title"
    t.string "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "print_version_url"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_ads_on_business_id"
    t.index ["publisher_id"], name: "index_ads_on_publisher_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "phone"
    t.string "description"
    t.string "site_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "publishers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "adPrice"
    t.string "currency"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
