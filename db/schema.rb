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

ActiveRecord::Schema.define(version: 20140807192814) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: true do |t|
    t.string   "title"
    t.string   "link"
    t.string   "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "submission_id"
  end

  add_index "attachments", ["submission_id"], name: "index_attachments_on_submission_id", using: :btree

  create_table "fest_participant_role_types", force: true do |t|
    t.integer  "role_id"
    t.integer  "participant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "fest_id"
  end

  create_table "fest_participant_submissions", force: true do |t|
    t.integer  "submission_id"
    t.integer  "participant_id"
    t.integer  "fest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fests", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "role_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.text     "bio"
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
    t.integer  "participant_id"
    t.boolean  "complete",       default: false
    t.boolean  "approve"
  end

  add_index "submissions", ["participant_id"], name: "index_submissions_on_participant_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "online_order_id"
    t.datetime "date_time"
    t.string   "status"
    t.integer  "participant_id"
  end

  add_index "tickets", ["participant_id"], name: "index_tickets_on_participant_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "type"
    t.integer  "participant_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["participant_id"], name: "index_users_on_participant_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
