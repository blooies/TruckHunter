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

ActiveRecord::Schema.define(version: 20140615185159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trucks", force: true do |t|
    t.string   "name",                                 null: false
    t.string   "twitter_handle",                       null: false
    t.boolean  "active",                default: true
    t.string   "profile_img_url"
    t.boolean  "approved",              default: true
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "tweets_last_fetched"
    t.datetime "location_last_updated"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tweets", force: true do |t|
    t.integer  "truck_id"
    t.text     "body",       null: false
    t.datetime "tweet_time", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
