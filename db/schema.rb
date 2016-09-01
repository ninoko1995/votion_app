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

ActiveRecord::Schema.define(version: 20160901035241) do

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.integer  "money",      default: 0
    t.integer  "liking",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.integer  "money"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "investments", ["candidate_id"], name: "index_investments_on_candidate_id"
  add_index "investments", ["user_id", "candidate_id"], name: "index_investments_on_user_id_and_candidate_id", unique: true
  add_index "investments", ["user_id"], name: "index_investments_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "name"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

end
