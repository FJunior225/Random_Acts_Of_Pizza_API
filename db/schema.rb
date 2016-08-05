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

ActiveRecord::Schema.define(version: 20160729165234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.integer  "creator_id",                  null: false
    t.string   "title",                       null: false
    t.string   "city",                        null: false
    t.string   "state",                       null: false
    t.integer  "pizzas",     default: 1
    t.string   "status",     default: "open"
    t.integer  "donor_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["creator_id"], name: "index_requests_on_creator_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.bigint   "fb_userID",              null: false
    t.string   "first_name",             null: false
    t.string   "email"
    t.integer  "rating",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
