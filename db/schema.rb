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

ActiveRecord::Schema.define(version: 20140805213756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fests", force: true do |t|
    t.datetime "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "online_order_id"
    t.string   "date_time"
    t.string   "status"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["participant_id"], name: "index_orders_on_participant_id", using: :btree

  create_table "participants", force: true do |t|
    t.string   "fname"
    t.string   "lname"
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "email"
    t.string   "twitter_link"
    t.string   "facebook_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participantsroles", force: true do |t|
    t.integer  "role_id"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "role_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_types", force: true do |t|
    t.string   "name"
    t.string   "sale_status"
    t.string   "price"
    t.string   "sku"
    t.integer  "fest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "qty"
    t.integer  "ticket_types_id"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
